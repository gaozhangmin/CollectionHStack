import CollectionHStack
import SwiftUI

struct ContentView: View {

    @FocusState
    var focusedI: Int?

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
            VStack {

                Text("\(focusedI ?? -1)")

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
                    .padding(50)
                    .focused($focusedI, equals: i)
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
                    .padding()
                    .padding()
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
                    .padding()
                    .padding()
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
                    .padding()
                    .padding()
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
                    .padding()
                    .padding()
                }
                .scrollBehavior(.continuousLeadingEdge)
            }
        }
        .ignoresSafeArea()
    }
}
