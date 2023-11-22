import SwiftUI

struct SongItem: View {
    var body: some View {
        HStack {
            Color.secondary
                .opacity(0.5)
                .aspectRatio(1, contentMode: .fill)
                .cornerRadius(2)
                .frame(width: 50, height: 50)

            VStack {
                Color.secondary
                    .opacity(0.5)
                    .frame(height: 0.2)

                HStack {
                    VStack(spacing: 2) {

                        Text("Song")
                            .font(.body)

                        Text("Artist")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }

                    Spacer()

                    Image(systemName: "ellipsis")
                        .font(.body)
                        .padding()
                }
            }
        }
    }
}
