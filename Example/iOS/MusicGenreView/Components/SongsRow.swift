import CollectionHStack
import SwiftUI

extension MusicGenreView {
    struct SongsRow: View {

        let title: String

        var body: some View {
            VStack(alignment: .leading) {
                HeaderView(title: title)
                    .padding(.leading, 18)

                CollectionHStack(
                    sampleAlbums.random(in: 21 ..< 31),
                    columns: 1,
                    rows: 4
                ) { album in
                    SongItem(album: album)
                }
                .scrollBehavior(.fullPaging)
                .insets(horizontal: 18)
                .itemSpacing(8)
            }
        }
    }
}
