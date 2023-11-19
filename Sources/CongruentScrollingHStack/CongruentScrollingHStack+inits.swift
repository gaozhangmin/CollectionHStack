import Foundation
import OrderedCollections
import SwiftUI

// TODO: inits without binding
// - pass in any Sequence, log warning when items contain duplicates
// - make sure to check if sequence is a Set/OrderedSet, like OrderedSet does

public extension CongruentScrollingHStack {

    init(
        items: Binding<OrderedSet<Item>>,
        columns: CGFloat,
        inset: CGFloat = 15,
        spacing: CGFloat = 10,
        scrollBehavior: CongruentScrollingHStackScrollBehavior = .continuous,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            didReachTrailingSide: {},
            didReachTrailingSideOffset: 0,
            didScrollToItems: { _ in },
            horizontalInset: inset,
            items: items,
            itemSpacing: spacing,
            layout: .columns(columns),
            scrollBehavior: scrollBehavior,
            viewProvider: content
        )
    }

    init(
        items: Binding<OrderedSet<Item>>,
        minWidth: CGFloat,
        inset: CGFloat = 15,
        spacing: CGFloat = 10,
        scrollBehavior: CongruentScrollingHStackScrollBehavior = .continuous,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            didReachTrailingSide: {},
            didReachTrailingSideOffset: 0,
            didScrollToItems: { _ in },
            horizontalInset: inset,
            items: items,
            itemSpacing: spacing,
            layout: .minimumWidth(minWidth),
            scrollBehavior: scrollBehavior,
            viewProvider: content
        )
    }

    init(
        items: Binding<OrderedSet<Item>>,
        inset: CGFloat = 15,
        spacing: CGFloat = 10,
        scrollBehavior: CongruentScrollingHStackScrollBehavior = .continuous,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            didReachTrailingSide: {},
            didReachTrailingSideOffset: 0,
            didScrollToItems: { _ in },
            horizontalInset: inset,
            items: items,
            itemSpacing: spacing,
            layout: .selfSizing,
            scrollBehavior: scrollBehavior,
            viewProvider: content
        )
    }
}

// TODO: columns and mindWidth inits
public extension CongruentScrollingHStack where Item == Int {

    init(
        _ data: Range<Int>,
        inset: CGFloat = 15,
        spacing: CGFloat = 10,
        scrollBehavior: CongruentScrollingHStackScrollBehavior = .continuous,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            didReachTrailingSide: {},
            didReachTrailingSideOffset: 0,
            didScrollToItems: { _ in },
            horizontalInset: inset,
            items: .constant(OrderedSet(data)),
            itemSpacing: spacing,
            layout: .selfSizing,
            scrollBehavior: scrollBehavior,
            viewProvider: content
        )
    }

    init(
        _ data: Range<Int>,
        columns: CGFloat,
        inset: CGFloat = 15,
        spacing: CGFloat = 10,
        scrollBehavior: CongruentScrollingHStackScrollBehavior = .continuous,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            didReachTrailingSide: {},
            didReachTrailingSideOffset: 0,
            didScrollToItems: { _ in },
            horizontalInset: inset,
            items: .constant(OrderedSet(data)),
            itemSpacing: spacing,
            layout: .columns(columns),
            scrollBehavior: scrollBehavior,
            viewProvider: content
        )
    }

    init(
        _ data: ClosedRange<Int>,
        inset: CGFloat = 15,
        spacing: CGFloat = 10,
        scrollBehavior: CongruentScrollingHStackScrollBehavior = .continuous,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            didReachTrailingSide: {},
            didReachTrailingSideOffset: 0,
            didScrollToItems: { _ in },
            horizontalInset: inset,
            items: .constant(OrderedSet(data)),
            itemSpacing: spacing,
            layout: .selfSizing,
            scrollBehavior: scrollBehavior,
            viewProvider: content
        )
    }
}
