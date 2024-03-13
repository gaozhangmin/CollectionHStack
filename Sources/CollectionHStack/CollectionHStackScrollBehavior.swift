import UIKit

// TODO: accustom for item sizes > collection view width?
// TODO: accustom for item spacing which will make no other items appear on targetContentOffset?
// TODO: centered scroll behavior

// get contentoffset from scrollview begin dragging
// manually compute offset from item widths

public enum CollectionHStackScrollBehavior {

    case columnPaging
    case continuous
    case continuousLeadingEdge
    case fullPaging

    var flowLayout: UICollectionViewFlowLayout {
        switch self {
        case .columnPaging:
            ColumnPagingFlowLayout()
        case .continuous:
            UICollectionViewFlowLayout()
        case .continuousLeadingEdge:
            ContinuousLeadingEdgeFlowLayout()
        case .fullPaging:
            FullPagingFlowLayout()
        }
    }
}

/// A `UICollectionViewFlowLayout` that aligns with a column of items
protocol ColumnAlignedLayout: UICollectionViewFlowLayout {

    // Used for determining the correct column to align against
    var rows: Int { get set }
}

/// A `UICollectionViewFlowLayout` that will stride along columns
protocol ColumnStridableLayout: UICollectionViewFlowLayout {

    var step: Int { get set }
}
