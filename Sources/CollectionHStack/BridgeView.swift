import OrderedCollections
import SwiftUI

struct BridgeView<Item: Hashable>: UIViewRepresentable {

    typealias UIViewType = UICollectionHStack<Item>

    let allowBouncing: Binding<Bool>
    let allowScrolling: Binding<Bool>
    let bottomInset: CGFloat
    let clipsToBounds: Bool
    let didScrollToItems: ([Item]) -> Void
    let horizontalInset: CGFloat
    let isCarousel: Bool
    let items: Binding<OrderedSet<Item>>
    let itemSpacing: CGFloat
    let layout: CollectionHStackLayout
    let onReachedLeadingEdge: () -> Void
    let onReachedLeadingEdgeOffset: CGFloat
    let onReachedTrailingEdge: () -> Void
    let onReachedTrailingEdgeOffset: CGFloat
    let scrollBehavior: CollectionHStackScrollBehavior
    let sizeObserver: SizeObserver
    let topInset: CGFloat
    let viewProvider: (Item) -> any View

    func makeUIView(context: Context) -> UIViewType {
        UICollectionHStack(
            bottomInset: bottomInset,
            clipsToBounds: clipsToBounds,
            didScrollToItems: didScrollToItems,
            horizontalInset: horizontalInset,
            isCarousel: isCarousel,
            items: items,
            itemSpacing: itemSpacing,
            layout: layout,
            onReachedLeadingEdge: onReachedLeadingEdge,
            onReachedLeadingEdgeOffset: onReachedLeadingEdgeOffset,
            onReachedTrailingEdge: onReachedTrailingEdge,
            onReachedTrailingEdgeOffset: onReachedTrailingEdgeOffset,
            scrollBehavior: scrollBehavior,
            sizeObserver: sizeObserver,
            topInset: topInset,
            viewProvider: viewProvider
        )
    }

    func updateUIView(_ view: UIViewType, context: Context) {
        view.updateItems(
            with: items,
            allowBouncing: allowBouncing.wrappedValue,
            allowScrolling: allowScrolling.wrappedValue
        )
    }
}
