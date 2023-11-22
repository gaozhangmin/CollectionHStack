import CongruentScrollingHStack
import SwiftUI

struct TwoRowHStack: View {

    let title: String

    var body: some View {
        VStack(alignment: .leading) {
            HeaderView(title: title)
                .padding(.leading, 18)

            CongruentScrollingHStack(
                0 ..< 20,
                columns: 2,
                rows: 2
            ) { _ in
                SquareView(
                    title: "Album Title",
                    subtitle: "Artist"
                )
            }
            .scrollBehavior(.fullPaging)
            .horizontalInset(18)
            .itemSpacing(8)
        }
    }
}
