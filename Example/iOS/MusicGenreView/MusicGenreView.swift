import CongruentScrollingHStack
import SwiftUI

struct MusicGenreView: View {

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                CongruentScrollingHStack(
                    0 ..< 20,
                    columns: 1
                ) { _ in
                    HeroCard(title: "Title")
                }
                .scrollBehavior(.fullPaging)
                .horizontalInset(18)

                TwoRowHStack(title: "Albums")

                SingleRowHStack(title: "New Releases")

                SingleRowHStack(title: "Coming Soon")

                SingleRowHStack(title: "New Releases")

                SongsRow(title: "Best New Songs")

                SingleRowHStack(title: "Hits by Decade")

                SingleRowHStack(title: "Hits by Year")
            }
        }
        .navigationTitle("Pop")
        .navigationBarTitleDisplayMode(.large)
    }
}
