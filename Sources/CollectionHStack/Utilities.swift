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

// MARK: Array

public extension Array {

    @inlinable
    func max(using keyPath: KeyPath<Element, some Comparable>) -> Element? {
        self.max(by: { $0[keyPath: keyPath] < $1[keyPath: keyPath] })
    }
}

// MARK: Collection

extension Sequence {

    func chunks(ofCount count: Int) -> [[Element]] {

        guard count > 0 else { return [Array(self)] }

        var results: [[Element]] = []
        var c: [Element] = []
        var i = 0
        var iterator = makeIterator()

        while let e = iterator.next() {
            if i % count == 0, !c.isEmpty {
                results.append(c)
                c = []
            }

            c.append(e)

            i += 1
        }

        if !c.isEmpty {
            results.append(c)
        }

        return results
    }

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

    static func makeSet<S: Sequence<Element>>(from elements: S) -> OrderedSet {

        if let data = elements as? OrderedSet<Element> {
            return data
        }

        if S.self == Set<Element>.self || S.self == OrderedSet<Element>.SubSequence.self {
            return OrderedSet(uncheckedUniqueElements: elements)
        }

        return OrderedSet(elements)
    }

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
