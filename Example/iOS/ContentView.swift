import CongruentScrollingHStack
import OrderedCollections
import SwiftUI

struct ContentView: View {

    @State
    var uuids = OrderedSet((0 ..< 100).map { _ in UUID() })

    var colors: [Color] = [
        .blue,
        .green,
        .yellow,
        .red,
        .orange,
        .purple,
        .pink,
        .cyan,
        .indigo,
        .mint,
        .teal,
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {

                    CongruentScrollingHStack(0 ..< 10, columns: 1, scrollBehavior: .itemPaging) { _ in
                        AsyncImage(
                            url: URL(string: "https://picsum.photos/750/500"),
                            transaction: Transaction(animation: .easeInOut)
                        ) { phase in
                            switch phase {
                            case let .success(image):
                                image
                                    .resizable()
                                    .transition(.opacity)
                            default:
                                Color.secondary
                                    .opacity(0.2)
                            }
                        }
                        .aspectRatio(1.5, contentMode: .fill)
                        .cornerRadius(5)
                    }

                    Text("Endless Colors")
                        .font(.title3)
                        .fontWeight(.bold)

                    Text("3 columns/continuous")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundStyle(.secondary)

                    CongruentScrollingHStack(items: $uuids, columns: 3) { uuid in
                        Button {
                            print(uuid.uuidString)
                        } label: {
                            ZStack {
                                Color.secondary

                                colors.randomElement()!
                                    .aspectRatio(2 / 3, contentMode: .fill)
                            }
                            .cornerRadius(5)
                        }
                    }
                    .onReachedTrailingEdge(offset: 300) {
                        let newUUIDS = (0 ..< 100).map { _ in UUID() }
                        uuids.append(contentsOf: newUUIDS)
                    }

                    Text("3 columns/continuousLeadingBoundary")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundStyle(.secondary)

                    CongruentScrollingHStack(items: $uuids, columns: 3, scrollBehavior: .continuousLeadingBoundary) { uuid in
                        Button {
                            print(uuid.uuidString)
                        } label: {
                            ZStack {
                                Color.secondary

                                colors.randomElement()!
                                    .aspectRatio(2 / 3, contentMode: .fill)
                            }
                            .cornerRadius(5)
                        }
                    }
                    .onReachedTrailingEdge(offset: 300) {
                        let newUUIDS = (0 ..< 100).map { _ in UUID() }
                        uuids.append(contentsOf: newUUIDS)
                    }

                    Text("Color Grid")
                        .font(.title3)
                        .fontWeight(.bold)

                    Text("4 columns/0 insets/0 spacing/continuousLeadingBoundary")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundStyle(.secondary)

                    VStack(spacing: 0) {
                        CongruentScrollingHStack(
                            0 ..< 100,
                            columns: 4,
                            inset: 0,
                            spacing: 0,
                            scrollBehavior: .continuousLeadingBoundary
                        ) { _ in
                            colors.randomElement()!
                                .aspectRatio(1, contentMode: .fill)
                        }

                        CongruentScrollingHStack(
                            0 ..< 100,
                            columns: 4,
                            inset: 0,
                            spacing: 0,
                            scrollBehavior: .continuousLeadingBoundary
                        ) { _ in
                            colors.randomElement()!
                                .aspectRatio(1, contentMode: .fill)
                        }

                        CongruentScrollingHStack(
                            0 ..< 100,
                            columns: 4,
                            inset: 0,
                            spacing: 0,
                            scrollBehavior: .continuousLeadingBoundary
                        ) { _ in
                            colors.randomElement()!
                                .aspectRatio(1, contentMode: .fill)
                        }

                        CongruentScrollingHStack(
                            0 ..< 100,
                            columns: 4,
                            inset: 0,
                            spacing: 0,
                            scrollBehavior: .continuousLeadingBoundary
                        ) { _ in
                            colors.randomElement()!
                                .aspectRatio(1, contentMode: .fill)
                        }
                    }

                    Text("Paging")
                        .font(.title3)
                        .fontWeight(.bold)

                    Text("1 column/item paging")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundStyle(.secondary)

                    CongruentScrollingHStack(0 ..< 10, columns: 1, scrollBehavior: .itemPaging) { _ in
                        colors.randomElement()!
                            .aspectRatio(3, contentMode: .fill)
                    }

                    Text("Self Sizing")
                        .font(.title3)
                        .fontWeight(.bold)

                    Text("self sizing/continuousLeadingBoundary")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundStyle(.secondary)

                    CongruentScrollingHStack(0 ..< 20, scrollBehavior: .continuousLeadingBoundary) { _ in
                        colors.randomElement()!
                            .frame(width: 200, height: 200)
                    }
                }
            }
            .navigationTitle("Example")
        }
    }
}
