import CongruentScrollingHStack
import SwiftUI

struct SingleRowHStack: View {

    let title: String

    var body: some View {
        VStack(alignment: .leading) {
            HeaderView(title: title)
                .padding(.leading, 18)

            CongruentScrollingHStack(
                0 ..< 20,
                columns: 2
            ) { _ in
                SquareView(
                    title: "Album Title",
                    subtitle: "Artist"
                )
            }
            .scrollBehavior(.continuousLeadingEdge)
            .horizontalInset(18)
            .itemSpacing(8)
        }
    }
}
