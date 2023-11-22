import DifferenceKit
import OrderedCollections
import SwiftUI

// MARK: CGFloat/Int math

@_disfavoredOverload
func * (lhs: CGFloat, rhs: Int) -> CGFloat {
    lhs * CGFloat(rhs)
}

@_disfavoredOverload
func * (lhs: Int, rhs: CGFloat) -> CGFloat {
    CGFloat(lhs) * rhs
}

@_disfavoredOverload
func / (lhs: CGFloat, rhs: Int) -> CGFloat {
    lhs / CGFloat(rhs)
}

@_disfavoredOverload
func / (lhs: Int, rhs: CGFloat) -> CGFloat {
    CGFloat(lhs) / rhs
}

@_disfavoredOverload
func % (lhs: CGFloat, rhs: CGFloat) -> CGFloat {
    lhs.truncatingRemainder(dividingBy: rhs)
}

// MARK: Collection

extension Sequence {

    func striding(by step: Int) -> [Element] {

        guard step > 1 else { return Array(self) }

        var results: [Element] = []
        var iterator = makeIterator()
        var i = 0

        while let element = iterator.next() {
            if i % step == 0 {
                results.append(element)
            }

            i += 1
        }

        return results
    }
}

// MARK: Int

extension Int: ContentEquatable, ContentIdentifiable {}

// MARK: OrderedSet

public extension OrderedSet {

    @inlinable
    @discardableResult
    mutating func append(checkingContentsOf elements: some Sequence<Element>) -> Bool {
        var didContainDuplicate = false

        for item in elements {
            didContainDuplicate = append(item).inserted || didContainDuplicate
        }

        return didContainDuplicate
    }
}

// MARK: UICollectionView

extension UICollectionView {

    var flowLayout: UICollectionViewFlowLayout {
        collectionViewLayout as! UICollectionViewFlowLayout
    }

    var isAtMinContentOffset: Bool {
        contentOffset == .zero
    }

    var isAtMaxContentOffset: Bool {
        contentOffset == maxContentOffset
    }

    var maxContentOffset: CGPoint {
        CGPoint(
            x: contentSize.width - bounds.width,
            y: contentSize.height - bounds.height
        )
    }
}

// MARK: UIEdgeInsets

extension UIEdgeInsets {

    var horizontal: CGFloat {
        left + right
    }

    var vertical: CGFloat {
        top + bottom
    }
}

// MARK: View

extension View {

    func copy<Value>(modifying keyPath: WritableKeyPath<Self, Value>, to newValue: Value) -> Self {
        var copy = self
        copy[keyPath: keyPath] = newValue
        return copy
    }
}
