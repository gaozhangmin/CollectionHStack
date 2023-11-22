import Foundation
import OrderedCollections
import SwiftUI

// TODO: look at macros?
// TODO: inits without binding
// - pass in any Sequence, log warning when items contain duplicates
// - make sure to check if sequence is a Set/OrderedSet, like OrderedSet does

// MARK: Binding<OrderedSet>

public extension CongruentScrollingHStack {

    init(
        items: Binding<OrderedSet<Item>>,
        columns: Int,
        columnTrailingInset: CGFloat = 0,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            items: items,
            layout: .grid(columns: CGFloat(columns), rows: 1, columnTrailingInset: columnTrailingInset),
            viewProvider: content
        )
    }

    init(
        items: Binding<OrderedSet<Item>>,
        columns: CGFloat,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            items: items,
            layout: .grid(columns: columns, rows: 1, columnTrailingInset: 0),
            viewProvider: content
        )
    }

    init(
        items: Binding<OrderedSet<Item>>,
        minWidth: CGFloat,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            items: items,
            layout: .minimumWidth(columnWidth: minWidth, rows: 0),
            viewProvider: content
        )
    }

    init(
        items: Binding<OrderedSet<Item>>,
        rows: Int = 1,
        variadicWidths: Bool = false,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            items: items,
            layout: variadicWidths ? .selfSizingVariadicWidth(rows: rows) : .selfSizingSameSize(rows: rows),
            viewProvider: content
        )
    }
}

// MARK: Range

// TODO: columns and mindWidth inits
public extension CongruentScrollingHStack where Item == Int {

    init(
        _ data: Range<Int>,
        rows: Int = 1,
        variadicWidths: Bool = false,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            items: .constant(OrderedSet(data)),
            layout: variadicWidths ? .selfSizingVariadicWidth(rows: rows) : .selfSizingSameSize(rows: rows),
            viewProvider: content
        )
    }

    init(
        _ data: Range<Int>,
        columns: Int,
        rows: Int = 1,
        columnTrailingInset: CGFloat = 0,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            items: .constant(OrderedSet(data)),
            layout: .grid(columns: CGFloat(columns), rows: rows, columnTrailingInset: 0),
            viewProvider: content
        )
    }

    init(
        _ data: Range<Int>,
        columns: CGFloat,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            items: .constant(OrderedSet(data)),
            layout: .grid(columns: columns, rows: 1, columnTrailingInset: 0),
            viewProvider: content
        )
    }
}

// MARK: ClosedRange

public extension CongruentScrollingHStack where Item == Int {

    init(
        _ data: ClosedRange<Int>,
        rows: Int = 1,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            items: .constant(OrderedSet(data)),
            layout: .selfSizingSameSize(rows: rows),
            viewProvider: content
        )
    }
}
