import CongruentScrollingHStack
import SwiftUI

struct LayoutView: View {

    @State
    private var minWidth: CGFloat = 120

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {

                // columns

                HeaderPopover(
                    title: "Columns",
                    description: "3 columns"
                )
                .padding(.leading, 15)

                CongruentScrollingHStack(
                    0 ..< 20,
                    columns: 3
                ) { _ in
                    Color.blue
                        .aspectRatio(2 / 3, contentMode: .fill)
                        .cornerRadius(5)
                }

                // minwidth

                HStack {
                    HeaderPopover(
                        title: "Minimum Width",
                        description: "Each column is guaranteed to have a guaranteed minimum width"
                    )

                    Spacer()

                    Text("\(minWidth, format: .number)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .padding(.trailing, 15)
                }
                .padding(.top, 30)
                .padding(.leading, 15)

                ZStack {
                    ScrollView {
                        CongruentScrollingHStack(
                            0 ..< 20,
                            minWidth: minWidth
                        ) { _ in
                            Color.blue
                                .aspectRatio(1.77, contentMode: .fill)
                                .cornerRadius(5)
                        }
                        .id(minWidth)
                    }
                    .scrollDisabledBackport(true)
                    .frame(height: 150)
                }

                Slider(value: $minWidth, in: 70 ... 150, step: 2)
                    .padding(.horizontal, 15)

                // column trailing inset

                HeaderPopover(
                    title: "Column Trailing Inset",
                    description: "Size columns after subtracting an inset from the trailing side. 3 columns, 60 column trailing inset"
                )
                .padding(.top, 30)
                .padding(.leading, 15)

                CongruentScrollingHStack(
                    0 ..< 20,
                    columns: 3,
                    columnTrailingInset: 60
                ) { _ in
                    Color.blue
                        .aspectRatio(2 / 3, contentMode: .fill)
                        .cornerRadius(5)
                }

                // fractional columns

                HeaderPopover(
                    title: "Fractional Columns",
                    description: "Columns can be determined fractionally"
                )
                .padding(.top, 30)
                .padding(.leading, 15)

                CongruentScrollingHStack(
                    0 ..< 20,
                    columns: 3.5
                ) { _ in
                    HStack(spacing: 0) {
                        Color.blue

                        Color.pink
                    }
                    .aspectRatio(2 / 3, contentMode: .fill)
                    .cornerRadius(5)
                }

                // self sizing

                HeaderPopover(
                    title: "Self Sizing",
                    description: "Views can be self sizing but must be the same size"
                )
                .padding(.top, 30)
                .padding(.leading, 15)

                CongruentScrollingHStack(0 ..< 20) { _ in
                    Color.blue
                        .aspectRatio(2 / 3, contentMode: .fill)
                        .frame(height: 200)
                        .cornerRadius(5)
                }

                // variadic widths

                HeaderPopover(
                    title: "Variadic Widths",
                    description: "Views can have different widths but must be the same height"
                )
                .padding(.top, 30)
                .padding(.leading, 15)

                CongruentScrollingHStack(
                    0 ..< 20,
                    variadicWidths: true
                ) { i in
                    colors[mod: i]
                        .frame(width: 50 * (CGFloat(i % 3) + 1), height: 200)
                        .cornerRadius(5)
                }

                // rows

                HeaderPopover(
                    title: "Rows",
                    description: "4 columns, 4 rows"
                )
                .padding(.top, 30)
                .padding(.leading, 15)

                CongruentScrollingHStack(
                    0 ..< 20,
                    columns: 4,
                    rows: 4
                ) { _ in
                    Color.blue
                        .aspectRatio(1, contentMode: .fill)
                        .cornerRadius(5)
                }
            }
        }
        .navigationTitle("Layout")
    }
}
