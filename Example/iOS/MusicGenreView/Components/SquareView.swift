import SwiftUI

struct SquareView: View {

    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading) {
            Color.secondary
                .opacity(0.5)
                .aspectRatio(1, contentMode: .fill)
                .cornerRadius(5)

            Text(title)
                .foregroundStyle(.primary)

            Text(subtitle)
                .foregroundStyle(.secondary)
        }
    }
}
