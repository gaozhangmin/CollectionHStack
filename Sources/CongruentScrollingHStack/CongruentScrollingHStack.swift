import OrderedCollections
import SwiftUI

public struct CongruentScrollingHStack<Item: Hashable>: View {

    @StateObject
    private var sizeObserver = SizeObserver()

    var allowScrolling: Binding<Bool>
    var didScrollToItems: ([Item]) -> Void
    let horizontalInset: CGFloat
    var isCarousel: Bool
    let items: Binding<OrderedSet<Item>>
    let itemSpacing: CGFloat
    let layout: CongruentScrollingHStackLayout
    var onReachedLeadingSide: () -> Void
    var onReachedLeadingSideOffset: CGFloat
    var onReachedTrailingEdge: () -> Void
    var onReachedTrailingEdgeOffset: CGFloat
    var scrollBehavior: CongruentScrollingHStackScrollBehavior
    let viewProvider: (Item) -> any View

    init(
        allowScrolling: Binding<Bool> = .constant(true),
        didScrollToItems: @escaping ([Item]) -> Void = { _ in },
        horizontalInset: CGFloat,
        isCarousel: Bool = false,
        items: Binding<OrderedSet<Item>>,
        itemSpacing: CGFloat,
        layout: CongruentScrollingHStackLayout,
        onReachedLeadingSide: @escaping () -> Void = {},
        onReachedLeadingSideOffset: CGFloat = 0,
        onReachedTrailingEdge: @escaping () -> Void = {},
        onReachedTrailingEdgeOffset: CGFloat = 0,
        scrollBehavior: CongruentScrollingHStackScrollBehavior = .continuous,
        viewProvider: @escaping (Item) -> any View
    ) {
        self.allowScrolling = allowScrolling
        self.didScrollToItems = didScrollToItems
        self.horizontalInset = horizontalInset
        self.isCarousel = isCarousel
        self.items = items
        self.itemSpacing = itemSpacing
        self.layout = layout
        self.onReachedLeadingSide = onReachedLeadingSide
        self.onReachedLeadingSideOffset = onReachedLeadingSideOffset
        self.onReachedTrailingEdge = onReachedTrailingEdge
        self.onReachedTrailingEdgeOffset = onReachedTrailingEdgeOffset
        self.scrollBehavior = scrollBehavior
        self.viewProvider = viewProvider
    }

    public var body: some View {
        ZStack {
            SizeObserverView(sizeObserver: sizeObserver)

            BridgeView(
                allowScrolling: allowScrolling,
                didScrollToItems: didScrollToItems,
                horizontalInset: horizontalInset,
                isCarousel: isCarousel,
                items: items,
                itemSpacing: itemSpacing,
                layout: layout,
                onReachedLeadingEdge: onReachedLeadingSide,
                onReachedLeadingEdgeOffset: onReachedLeadingSideOffset,
                onReachedTrailingEdge: onReachedTrailingEdge,
                onReachedTrailingEdgeOffset: onReachedTrailingEdgeOffset,
                scrollBehavior: scrollBehavior,
                sizeObserver: sizeObserver,
                viewProvider: viewProvider
            )
        }
    }
}
