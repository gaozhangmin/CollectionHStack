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
}
