import Foundation
import OrderedCollections
import SwiftUI

// TODO: look at macros?
// TODO: on tvOS, focus updates cause reconstructions of the non-binding init sets

// MARK: Binding<OrderedSet>

public extension CollectionHStack {

    // columns
    init(
        _ data: Binding<OrderedSet<Item>>,
        columns: Int,
        rows: Int = 1,
        columnTrailingInset: CGFloat = 0,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            items: data,
            layout: .grid(columns: CGFloat(columns), rows: rows, columnTrailingInset: columnTrailingInset),
            viewProvider: content
        )
    }

    // fractional columns
    init(
        _ data: Binding<OrderedSet<Item>>,
        columns: CGFloat,
        rows: Int = 1,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            items: data,
            layout: .grid(columns: columns, rows: rows, columnTrailingInset: 0),
            viewProvider: content
        )
    }

    // minWidth
    init(
        _ data: Binding<OrderedSet<Item>>,
        minWidth: CGFloat,
        rows: Int = 1,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            items: data,
            layout: .minimumWidth(columnWidth: minWidth, rows: rows),
            viewProvider: content
        )
    }

    // self/variadic sizing
    init(
        _ data: Binding<OrderedSet<Item>>,
        rows: Int = 1,
        variadicWidths: Bool = false,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            items: data,
            layout: variadicWidths ? .selfSizingVariadicWidth(rows: rows) : .selfSizingSameSize(rows: rows),
            viewProvider: content
        )
    }
}

// MARK: Range

// TODO: columns and mindWidth inits
public extension CollectionHStack where Item == Int {

    // columns
    init(
        _ data: Range<Int>,
        columns: Int,
        rows: Int = 1,
        columnTrailingInset: CGFloat = 0,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            .constant(OrderedSet(data)),
            columns: columns,
            rows: rows,
            columnTrailingInset: columnTrailingInset,
            content: content
        )
    }

    // fractional columns
    init(
        _ data: Range<Int>,
        columns: CGFloat,
        rows: Int = 1,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            .constant(OrderedSet(data)),
            columns: columns,
            content: content
        )
    }

    // minWidth
    init(
        _ data: Range<Int>,
        minWidth: CGFloat,
        rows: Int = 1,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            .constant(OrderedSet(data)),
            minWidth: minWidth,
            rows: rows,
            content: content
        )
    }

    // self/variadic sizing
    init(
        _ data: Range<Int>,
        rows: Int = 1,
        variadicWidths: Bool = false,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            .constant(OrderedSet(data)),
            rows: rows,
            variadicWidths: variadicWidths,
            content: content
        )
    }
}

// MARK: Sequence

public extension CollectionHStack {

    // columns
    init(
        _ data: some Sequence<Item>,
        columns: Int,
        rows: Int = 1,
        columnTrailingInset: CGFloat = 0,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            .constant(OrderedSet.makeSet(from: data)),
            columns: columns,
            rows: rows,
            columnTrailingInset: columnTrailingInset,
            content: content
        )
    }

    // fractional columns
    init(
        _ data: some Sequence<Item>,
        columns: CGFloat,
        rows: Int = 1,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            .constant(OrderedSet.makeSet(from: data)),
            columns: columns,
            content: content
        )
    }

    // minWidth
    init(
        _ data: some Sequence<Item>,
        minWidth: CGFloat,
        rows: Int = 1,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            .constant(OrderedSet.makeSet(from: data)),
            minWidth: minWidth,
            rows: rows,
            content: content
        )
    }

    // self/variadic sizing
    init(
        _ data: some Sequence<Item>,
        rows: Int = 1,
        variadicWidths: Bool = false,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            .constant(OrderedSet.makeSet(from: data)),
            rows: rows,
            variadicWidths: variadicWidths,
            content: content
        )
    }
}
