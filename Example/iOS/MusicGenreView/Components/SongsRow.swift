import CongruentScrollingHStack
import SwiftUI

struct SongsRow: View {

    let title: String

    var body: some View {
        VStack(alignment: .leading) {
            HeaderView(title: title)
                .padding(.leading, 18)

            CongruentScrollingHStack(
                0 ..< 20,
                columns: 1,
                rows: 4
            ) { _ in
                SongItem()
            }
            .scrollBehavior(.fullPaging)
            .horizontalInset(18)
            .itemSpacing(8)
        }
    }
}
