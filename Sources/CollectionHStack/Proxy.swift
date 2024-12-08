import Foundation
import UIKit

public class CollectionHStackProxy: ObservableObject {

    weak var collectionView: _UICollectionHStack?

    public init() {
        self.collectionView = nil
    }

    public func scrollTo(index: Int, animated: Bool = true) {
        collectionView?.scrollTo(index: index, animated: animated)
    }

    public func scrollTo(element: some Identifiable, animated: Bool = true) {
        guard let index = collectionView?.index(for: element.id.hashValue) else { return }
        scrollTo(index: index, animated: animated)
    }

    /// Forces the `CollectionHStack` to re-layout its views.
    /// This is useful if the layout is the same, but the views
    /// have changed and require re-drawing.
    public func layout() {
        collectionView?.snapshotReload()
    }
}
