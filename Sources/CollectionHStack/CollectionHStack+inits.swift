import Foundation
import OrderedCollections
import SwiftUI

// TODO: allow binding to any sequence with init(uncheckedUniqueElements:)?
// TODO: on tvOS, focus updates cause reconstructions of the non-binding init sets

// MARK: Binding<OrderedSet>

public extension CollectionHStack {

    // columns
    init(
        _ data: Binding<OrderedSet<Element>>,
        columns: Int,
        rows: Int = 1,
        columnTrailingInset: CGFloat = 0,
        @ViewBuilder content: @escaping (Element) -> any View
    ) {
        self.init(
            data: data,
            layout: .grid(columns: CGFloat(columns), rows: rows, columnTrailingInset: columnTrailingInset),
            viewProvider: content
        )
    }

    // fractional columns
    init(
        _ data: Binding<OrderedSet<Element>>,
        columns: CGFloat,
        rows: Int = 1,
        @ViewBuilder content: @escaping (Element) -> any View
    ) {
        self.init(
            data: data,
            layout: .grid(columns: columns, rows: rows, columnTrailingInset: 0),
            viewProvider: content
        )
    }

    // minWidth
    init(
        _ data: Binding<OrderedSet<Element>>,
        minWidth: CGFloat,
        rows: Int = 1,
        @ViewBuilder content: @escaping (Element) -> any View
    ) {
        self.init(
            data: data,
            layout: .minimumWidth(columnWidth: minWidth, rows: rows),
            viewProvider: content
        )
    }

    // self/variadic sizing
    init(
        _ data: Binding<OrderedSet<Element>>,
        rows: Int = 1,
        variadicWidths: Bool = false,
        @ViewBuilder content: @escaping (Element) -> any View
    ) {
        self.init(
            data: data,
            layout: variadicWidths ? .selfSizingVariadicWidth(rows: rows) : .selfSizingSameSize(rows: rows),
            viewProvider: content
        )
    }
}

// MARK: Range

public extension CollectionHStack where Element == Int {

    // columns
    init(
        _ data: Range<Int>,
        columns: Int,
        rows: Int = 1,
        columnTrailingInset: CGFloat = 0,
        @ViewBuilder content: @escaping (Element) -> any View
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
        @ViewBuilder content: @escaping (Element) -> any View
    ) {
        self.init(
            .constant(OrderedSet(data)),
            columns: columns,
            rows: rows,
            content: content
        )
    }

    // minWidth
    init(
        _ data: Range<Int>,
        minWidth: CGFloat,
        rows: Int = 1,
        @ViewBuilder content: @escaping (Element) -> any View
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
        @ViewBuilder content: @escaping (Element) -> any View
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
        _ data: some Sequence<Element>,
        columns: Int,
        rows: Int = 1,
        columnTrailingInset: CGFloat = 0,
        @ViewBuilder content: @escaping (Element) -> any View
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
        _ data: some Sequence<Element>,
        columns: CGFloat,
        rows: Int = 1,
        @ViewBuilder content: @escaping (Element) -> any View
    ) {
        self.init(
            .constant(OrderedSet(data)),
            columns: columns,
            rows: rows,
            content: content
        )
    }

    // minWidth
    init(
        _ data: some Sequence<Element>,
        minWidth: CGFloat,
        rows: Int = 1,
        @ViewBuilder content: @escaping (Element) -> any View
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
        _ data: some Sequence<Element>,
        rows: Int = 1,
        variadicWidths: Bool = false,
        @ViewBuilder content: @escaping (Element) -> any View
    ) {
        self.init(
            .constant(OrderedSet(data)),
            rows: rows,
            variadicWidths: variadicWidths,
            content: content
        )
    }
}
