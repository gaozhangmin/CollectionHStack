import CongruentScrollingHStack
import SwiftUI

struct ScrollBehaviorView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {

                // continuous

                HeaderPopover(
                    title: "Continuous",
                    description: "Continuously scroll (default)"
                )
                .padding(.top, 30)
                .padding(.leading, 15)

                CongruentScrollingHStack(
                    0 ..< 20,
                    columns: 2
                ) { _ in
                    Color.blue
                        .aspectRatio(1.77, contentMode: .fill)
                        .cornerRadius(5)
                }

                // continuous leading edge

                HeaderPopover(
                    title: "Continuous Leading edge",
                    description: "Continuously scroll and align along the leading edge of the leading item"
                )
                .padding(.top, 30)
                .padding(.leading, 15)

                CongruentScrollingHStack(
                    0 ..< 20,
                    columns: 2.5
                ) { _ in
                    Color.blue
                        .aspectRatio(1.77, contentMode: .fill)
                        .cornerRadius(5)
                }
                .scrollBehavior(.continuousLeadingEdge)

                // column paging

                HeaderPopover(
                    title: "Column Paging",
                    description: "Page along items"
                )
                .padding(.top, 30)
                .padding(.leading, 15)

                CongruentScrollingHStack(
                    0 ..< 20,
                    columns: 2.5
                ) { _ in
                    Color.blue
                        .aspectRatio(1.77, contentMode: .fill)
                        .cornerRadius(5)
                }
                .scrollBehavior(.columnPaging)

                // full paging

                HeaderPopover(
                    title: "Full Paging",
                    description: "Page along the full width of the view. Best used with whole numbered column layouts"
                )
                .padding(.top, 30)
                .padding(.leading, 15)

                CongruentScrollingHStack(
                    0 ..< 20,
                    columns: 2
                ) { _ in
                    Color.blue
                        .aspectRatio(1.77, contentMode: .fill)
                        .cornerRadius(5)
                }
                .scrollBehavior(.fullPaging)
            }
        }
        .navigationTitle("Scroll Behavior")
    }
}
