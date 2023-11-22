import SwiftUI

private let heroCardTags: [String] = [
    "new album",
    "featured playlist",
    "new single just added",
    "essential album",
    "just updated",
    "listen now",
    "updated playlist",
    "new music",
    "special announcement",
    "radio station",
    "only on apple music",
]

struct HeroCard: View {

    let title: String

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(heroCardTags.randomElement()!.uppercased())
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .lineLimit(1)

            Text(title)
                .font(.title)
                .lineLimit(1)

            Color.secondary
                .opacity(0.5)
                .aspectRatio(1.77, contentMode: .fill)
                .cornerRadius(8)
        }
    }
}
