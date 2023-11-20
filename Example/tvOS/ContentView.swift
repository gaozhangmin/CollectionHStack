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
                    columns: 1.2,
                    inset: 20,
                    spacing: 10,
                    scrollBehavior: .continuousLeadingEdge
                ) { i in
                    Button {
                        print(i)
                    } label: {
                        colors.randomElement()!
                            .aspectRatio(3, contentMode: .fill)
                    }
                    .buttonStyle(.card)
                    .padding()
                    .padding()
                    .padding()
                }
                .asCarousel()

                CongruentScrollingHStack(0 ..< 30, columns: 6.5) { i in
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

                CongruentScrollingHStack(0 ..< 30, columns: 6.5) { i in
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

                CongruentScrollingHStack(0 ..< 30, columns: 6.5) { i in
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

                CongruentScrollingHStack(0 ..< 30, columns: 6.5) { i in
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
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
