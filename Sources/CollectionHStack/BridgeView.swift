import OrderedCollections
import SwiftUI

struct BridgeView<Element: Hashable>: UIViewRepresentable {

    typealias UIViewType = UICollectionHStack<Element>

    let allowBouncing: Binding<Bool>
    let allowScrolling: Binding<Bool>
    let bottomInset: CGFloat
    let clipsToBounds: Bool
    let data: Binding<OrderedSet<Element>>
    let dataPrefix: Binding<Int?>
    let didScrollToItems: ([Element]) -> Void
    let horizontalInset: CGFloat
    let isCarousel: Bool
    let itemSpacing: CGFloat
    let layout: CollectionHStackLayout
    let onReachedLeadingEdge: () -> Void
    let onReachedLeadingEdgeOffset: CGFloat
    let onReachedTrailingEdge: () -> Void
    let onReachedTrailingEdgeOffset: CGFloat
    let scrollBehavior: CollectionHStackScrollBehavior
    let sizeObserver: SizeObserver
    let topInset: CGFloat
    let viewProvider: (Element) -> any View

    func makeUIView(context: Context) -> UIViewType {
        UICollectionHStack(
            bottomInset: bottomInset,
            clipsToBounds: clipsToBounds,
            data: data,
            didScrollToItems: didScrollToItems,
            horizontalInset: horizontalInset,
            isCarousel: isCarousel,
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
        view.update(
            with: data,
            allowBouncing: allowBouncing.wrappedValue,
            allowScrolling: allowScrolling.wrappedValue,
            dataPrefix: dataPrefix.wrappedValue
        )
    }
}
