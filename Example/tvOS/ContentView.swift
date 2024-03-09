import CollectionHStack
import SwiftUI

struct ContentView: View {

    let colors: [Color] = [
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
        ScrollView {
            VStack(spacing: 50) {

                Spacer(minLength: 50)

                CollectionHStack(
                    0 ..< 10,
                    columns: 1
                ) { i in
                    Button {
                        print(i)
                    } label: {
                        colors.randomElement()!
                            .aspectRatio(3, contentMode: .fill)
                    }
                    .buttonStyle(.card)
                }
                .asCarousel()
                .scrollBehavior(.fullPaging)

                CollectionHStack(
                    0 ..< 72,
                    columns: 6
                ) { i in
                    Button {
                        print(i)
                    } label: {
                        Color(hue: Double(i * 5) / 360, saturation: 1, brightness: 1)
                            .aspectRatio(2 / 3, contentMode: .fill)
                            .cornerRadius(5)
                    }
                    .buttonStyle(.card)
                }
                .asCarousel()
                .scrollBehavior(.continuousLeadingEdge)

                CollectionHStack(
                    0 ..< 30,
                    columns: 6
                ) { i in
                    Button {
                        print(i)
                    } label: {
                        colors.randomElement()!
                            .aspectRatio(2 / 3, contentMode: .fill)
                    }
                    .buttonStyle(.card)
                }
                .scrollBehavior(.continuousLeadingEdge)

                CollectionHStack(
                    0 ..< 30,
                    columns: 6
                ) { i in
                    Button {
                        print(i)
                    } label: {
                        colors.randomElement()!
                            .aspectRatio(2 / 3, contentMode: .fill)
                    }
                    .buttonStyle(.card)
                }
                .scrollBehavior(.continuousLeadingEdge)

                CollectionHStack(
                    0 ..< 30,
                    columns: 6
                ) { i in
                    Button {
                        print(i)
                    } label: {
                        colors.randomElement()!
                            .aspectRatio(2 / 3, contentMode: .fill)
                    }
                    .buttonStyle(.card)
                }
                .scrollBehavior(.continuousLeadingEdge)

                Spacer(minLength: 50)
            }
        }
        .ignoresSafeArea()
    }
}
