import CongruentScrollingHStack
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
            VStack {
                CongruentScrollingHStack(
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
                }
                .asCarousel()
                .scrollBehavior(.fullPaging)

                CongruentScrollingHStack(
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

                CongruentScrollingHStack(
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

                CongruentScrollingHStack(
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

                CongruentScrollingHStack(
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
