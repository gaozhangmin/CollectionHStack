import Foundation
import UIKit

public class CollectionHStackProxy<Element: Hashable>: ObservableObject {

    weak var collectionView: UICollectionHStack<Element>?

    public init() {
        self.collectionView = nil
    }

    public func scrollTo(index: Int, animated: Bool = true) {
        collectionView?.scrollTo(index: index, animated: animated)
    }

    public func scrollTo(element: Element, animated: Bool = true) {
        collectionView?.scrollTo(element: element, animated: animated)
    }

    /// Forces the `CollectionHStack` to re-layout its views.
    /// This is useful if the layout is the same, but the views
    /// have changed and require re-drawing.
    public func layout() {
        collectionView?.snapshotReload()
    }
}
