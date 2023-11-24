import Foundation
import OrderedCollections
import SwiftUI

// TODO: look at macros?
// TODO: inits without binding
// - pass in any Sequence, log warning when items contain duplicates
// - make sure to check if sequence is a Set/OrderedSet, like OrderedSet does

// MARK: Binding<OrderedSet>

public extension CollectionHStack {

    // whole columns with trailing inset
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

    // self sizing
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
            layout: .grid(columns: CGFloat(columns), rows: rows, columnTrailingInset: columnTrailingInset),
            viewProvider: content
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
            items: .constant(OrderedSet(data)),
            layout: .grid(columns: columns, rows: rows, columnTrailingInset: 0),
            viewProvider: content
        )
    }

    init(
        _ data: Range<Int>,
        minWidth: CGFloat,
        rows: Int = 1,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        self.init(
            items: .constant(OrderedSet(data)),
            layout: .minimumWidth(columnWidth: minWidth, rows: rows),
            viewProvider: content
        )
    }
}

// MARK: Sequence

public extension CollectionHStack {

    init<S: Sequence<Item>>(
        _ data: S,
        columns: Int,
        rows: Int = 1,
        columnTrailingInset: CGFloat = 0,
        @ViewBuilder content: @escaping (Item) -> any View
    ) {
        if let data = data as? OrderedSet<Item> {
            self.init(
                .constant(data),
                columns: columns,
                rows: rows,
                columnTrailingInset: columnTrailingInset,
                content: content
            )
            return
        }

        if S.self == Set<Item>.self || S.self == OrderedSet<Item>.SubSequence.self {
            let data = OrderedSet(uncheckedUniqueElements: data)

            self.init(
                .constant(data),
                columns: columns,
                rows: rows,
                columnTrailingInset: columnTrailingInset,
                content: content
            )
            return
        }

        self.init(
            .constant(OrderedSet(data)),
            columns: columns,
            rows: rows,
            columnTrailingInset: columnTrailingInset,
            content: content
        )
    }
}
