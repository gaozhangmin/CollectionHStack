import OrderedCollections
import SwiftUI

public struct CongruentScrollingHStack<Item: Hashable>: View {

    @StateObject
    private var sizeObserver = SizeObserver()

    private var didReachTrailingSide: () -> Void
    private var didReachTrailingSideOffset: CGFloat
    private var didScrollToItems: ([Item]) -> Void
    private let horizontalInset: CGFloat
    private let items: Binding<OrderedSet<Item>>
    private let itemSpacing: CGFloat
    private let layout: CongruentScrollingHStackLayout
    private let scrollBehavior: CongruentScrollingHStackScrollBehavior
    private let viewProvider: (Item) -> any View

    init(
        didReachTrailingSide: @escaping () -> Void,
        didReachTrailingSideOffset: CGFloat,
        didScrollToItems: @escaping ([Item]) -> Void,
        horizontalInset: CGFloat,
        items: Binding<OrderedSet<Item>>,
        itemSpacing: CGFloat,
        layout: CongruentScrollingHStackLayout,
        scrollBehavior: CongruentScrollingHStackScrollBehavior,
        viewProvider: @escaping (Item) -> any View
    ) {
        self.didReachTrailingSide = didReachTrailingSide
        self.didReachTrailingSideOffset = didReachTrailingSideOffset
        self.didScrollToItems = didScrollToItems
        self.horizontalInset = horizontalInset
        self.items = items
        self.itemSpacing = itemSpacing
        self.layout = layout
        self.scrollBehavior = scrollBehavior
        self.viewProvider = viewProvider
    }

    public var body: some View {
        ZStack {
            SizeObserverView(sizeObserver: sizeObserver)

            BridgeView(
                didReachTrailingSide: didReachTrailingSide,
                didReachTrailingSideOffset: didReachTrailingSideOffset,
                didScrollToItems: didScrollToItems,
                horizontalInset: horizontalInset,
                items: items,
                itemSpacing: itemSpacing,
                layout: layout,
                scrollBehavior: scrollBehavior,
                sizeObserver: sizeObserver,
                viewProvider: viewProvider
            )
        }
    }
}

public extension CongruentScrollingHStack {

    func didScrollToItems(_ action: @escaping ([Item]) -> Void) -> Self {
        copy(modifying: \.didScrollToItems, to: action)
    }

    func onReachedTrailingEdge(offset: CGFloat = 0, _ action: @escaping () -> Void) -> Self {
        copy(modifying: \.didReachTrailingSide, to: action)
            .copy(modifying: \.didReachTrailingSideOffset, to: offset)
    }
}
