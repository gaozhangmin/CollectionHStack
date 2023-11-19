import UIKit

// TODO: Better names for flow layouts
// TODO: centered scroll behavior

public enum CongruentScrollingHStackScrollBehavior {

    case continuous
    case continuousLeadingBoundary
    case itemPaging

    var flowLayout: UICollectionViewFlowLayout {
        switch self {
        case .continuous:
            UICollectionViewFlowLayout()
        case .continuousLeadingBoundary:
            SingleRowFlowLayout()
        case .itemPaging:
            SingleRowFlowPagingItemLayout()
        }
    }
}

/// Similar to `UICollectionLayoutSectionOrthogonalScrollingBehavior.continuousGroupLeadingBoundary`, where scrolling will align
/// along the leading boundary of an item minus the section's leading inset. If the proposed target content offset is the last item,
/// the last item will be aligned along the trailing edge with the section's trailing inset.
///
/// Item Center Scroll Behavior - if the proposed target content offset is less than half of the leading item's center, scrolling will align
///                               with that item's leading boundary. Otherwise, scrolling will align with the next item's leading boundary.
class SingleRowFlowLayout: UICollectionViewFlowLayout {

    override func targetContentOffset(
        forProposedContentOffset proposedContentOffset: CGPoint,
        withScrollingVelocity velocity: CGPoint
    ) -> CGPoint {

        let targetRect = CGRect(
            x: proposedContentOffset.x,
            y: 0,
            width: collectionView!.bounds.size.width,
            height: collectionView!.bounds.size.height
        )

        let layoutAttributes = layoutAttributesForElements(in: targetRect)!

        guard layoutAttributes.count > 1 else { return proposedContentOffset }

        // allow scrolling to last element
        if proposedContentOffset.x == collectionView!.contentSize.width - collectionView!.bounds.width {
            return proposedContentOffset
        }

        let m: CGFloat = if proposedContentOffset.x > layoutAttributes[0].center.x {
            layoutAttributes[1].frame.minX
        } else {
            layoutAttributes[0].frame.minX
        }

        let leadingInset = (collectionView!.collectionViewLayout as! UICollectionViewFlowLayout).sectionInset.left

        return CGPoint(
            x: m - leadingInset,
            y: proposedContentOffset.y
        )
    }
}

class SingleRowFlowPagingItemLayout: UICollectionViewFlowLayout {

    override func targetContentOffset(
        forProposedContentOffset proposedContentOffset: CGPoint,
        withScrollingVelocity velocity: CGPoint
    ) -> CGPoint {

        let targetRect = CGRect(
            x: collectionView!.contentOffset.x,
            y: 0,
            width: collectionView!.bounds.size.width,
            height: collectionView!.bounds.size.height
        )

        let layoutAttributes = layoutAttributesForElements(in: targetRect)!

        guard layoutAttributes.count > 1 else { return proposedContentOffset }

        let m: CGFloat

        if velocity.x > 0 {
            m = layoutAttributes[1].frame.minX
        } else if velocity.x < 0 {
            m = layoutAttributes[0].frame.minX
        } else if velocity.x == 0 {
            if proposedContentOffset.x > layoutAttributes[0].center.x {
                m = layoutAttributes[1].frame.minX
            } else {
                m = layoutAttributes[0].frame.minX
            }
        } else {
            m = layoutAttributes[0].frame.minX
        }

        let leadingInset = (collectionView!.collectionViewLayout as! UICollectionViewFlowLayout).sectionInset.left

        return CGPoint(
            x: m - leadingInset,
            y: proposedContentOffset.y
        )
    }
}
