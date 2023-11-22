import OrderedCollections
import SwiftUI

public struct CongruentScrollingHStack<Item: Hashable>: View {

    @StateObject
    private var sizeObserver = SizeObserver()

    var allowBouncing: Binding<Bool>
    var allowScrolling: Binding<Bool>
    var bottomInset: CGFloat
    var clipsToBounds: Bool
    var didScrollToItems: ([Item]) -> Void
    var horizontalInset: CGFloat
    var isCarousel: Bool
    let items: Binding<OrderedSet<Item>>
    var itemSpacing: CGFloat
    let layout: CongruentScrollingHStackLayout
    var onReachedLeadingSide: () -> Void
    var onReachedLeadingSideOffset: CGFloat
    var onReachedTrailingEdge: () -> Void
    var onReachedTrailingEdgeOffset: CGFloat
    var scrollBehavior: CongruentScrollingHStackScrollBehavior
    var topInset: CGFloat
    let viewProvider: (Item) -> any View

    init(
        allowBouncing: Binding<Bool> = .constant(true),
        allowScrolling: Binding<Bool> = .constant(true),
        bottomInset: CGFloat = 0,
        clipsToBounds: Bool = false,
        didScrollToItems: @escaping ([Item]) -> Void = { _ in },
        horizontalInset: CGFloat = 15,
        isCarousel: Bool = false,
        items: Binding<OrderedSet<Item>>,
        itemSpacing: CGFloat = 10,
        layout: CongruentScrollingHStackLayout,
        onReachedLeadingSide: @escaping () -> Void = {},
        onReachedLeadingSideOffset: CGFloat = 0,
        onReachedTrailingEdge: @escaping () -> Void = {},
        onReachedTrailingEdgeOffset: CGFloat = 0,
        scrollBehavior: CongruentScrollingHStackScrollBehavior = .continuous,
        topInset: CGFloat = 0,
        viewProvider: @escaping (Item) -> any View
    ) {
        self.allowBouncing = allowBouncing
        self.allowScrolling = allowScrolling
        self.bottomInset = bottomInset
        self.clipsToBounds = clipsToBounds
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
        self.topInset = topInset
        self.viewProvider = viewProvider
    }

    public var body: some View {
        ZStack {
            SizeObserverView(sizeObserver: sizeObserver)

            BridgeView(
                allowBouncing: allowBouncing,
                allowScrolling: allowScrolling,
                bottomInset: bottomInset,
                clipsToBounds: clipsToBounds,
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
                topInset: topInset,
                viewProvider: viewProvider
            )
        }
    }
}
