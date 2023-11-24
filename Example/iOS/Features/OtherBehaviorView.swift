import CollectionHStack
import SwiftUI

struct OtherBehaviorView: InterfaceIdiomView {

    @Environment(\.colorScheme)
    var colorScheme

    @State
    var allowBouncing = true
    @State
    var allowScrolling = true
    @State
    var onEdgeColor = Color.blue

    var iPadBody: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {

                // carousel

                HeaderPopover(
                    title: "Carousel",
                    description: "Cells are reused and wrapped around the trailing end"
                )
                .padding(.leading, 15)

                CollectionHStack(
                    0 ..< 72,
                    columns: 6
                ) { i in
                    colorWheel(radius: i * 5)
                        .aspectRatio(2 / 3, contentMode: .fill)
                        .cornerRadius(5)
                }
                .asCarousel()

                // On edge modifiers

                HeaderPopover(
                    title: "On edge modifiers",
                    description: "Modifiers for reaching the leading and trailing edges"
                )
                .padding(.top, 30)
                .padding(.leading, 15)

                CollectionHStack(
                    0 ..< 10,
                    columns: 6
                ) { _ in
                    OnEdgeColorView(color: $onEdgeColor)
                }
                .onReachedLeadingEdge(offset: 10) {
                    withAnimation {
                        onEdgeColor = .blue
                    }
                }
                .onReachedTrailingEdge(offset: 10) {
                    withAnimation {
                        onEdgeColor = .pink
                    }
                }

                // Bouncing

                HStack {
                    HeaderPopover(
                        title: "Toggle bouncing",
                        description: "Enable/disable bouncing"
                    )

                    Spacer()

                    Button {
                        allowBouncing.toggle()
                    } label: {
                        Text(allowBouncing ? "Disable" : "Enable")
                            .font(.body.weight(.semibold))
                            .foregroundStyle(.secondary)
                            .padding(.trailing, 15)
                    }
                }
                .padding(.top, 30)
                .padding(.leading, 15)

                CollectionHStack(
                    0 ..< 20,
                    columns: 6
                ) { _ in
                    Color.blue
                        .aspectRatio(2 / 3, contentMode: .fill)
                        .cornerRadius(5)
                }
                .allowBouncing($allowBouncing)

                // Scrolling

                HStack {
                    HeaderPopover(
                        title: "Toggle scrolling",
                        description: "Enable/disable scrolling"
                    )

                    Spacer()

                    Button {
                        allowScrolling.toggle()
                    } label: {
                        Text(allowScrolling ? "Disable" : "Enable")
                            .font(.body.weight(.semibold))
                            .foregroundStyle(.secondary)
                            .padding(.trailing, 15)
                    }
                }
                .padding(.top, 30)
                .padding(.leading, 15)

                CollectionHStack(
                    0 ..< 20,
                    columns: 6
                ) { _ in
                    Color.blue
                        .aspectRatio(2 / 3, contentMode: .fill)
                        .cornerRadius(5)
                }
                .allowScrolling($allowScrolling)

                // Clips to bounds

                HeaderPopover(
                    title: "Clips to bounds",
                    description: "Disable clipping cells along the view's bounds"
                )
                .padding(.top, 30)
                .padding(.leading, 15)

                Text("Clipped")
                    .padding(.leading, 15)

                CollectionHStack(
                    0 ..< 20,
                    columns: 6
                ) { _ in
                    Color.blue
                        .aspectRatio(2 / 3, contentMode: .fill)
                        .cornerRadius(5)
                        .shadow(
                            color: colorScheme == .light ? Color.black : Color.white,
                            radius: 10
                        )
                }

                Text("Not clipped")
                    .padding(.leading, 15)

                CollectionHStack(
                    0 ..< 20,
                    columns: 6
                ) { _ in
                    Color.blue
                        .aspectRatio(2 / 3, contentMode: .fill)
                        .cornerRadius(5)
                        .shadow(
                            color: colorScheme == .light ? Color.black : Color.white,
                            radius: 10
                        )
                }
                .clipsToBounds(false)
            }
        }
        .navigationTitle("Other")
    }

    var iPhoneBody: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {

                // carousel

                HeaderPopover(
                    title: "Carousel",
                    description: "Cells are reused and wrapped around the trailing end"
                )
                .padding(.leading, 15)

                CollectionHStack(
                    0 ..< 72,
                    columns: 3
                ) { i in
                    colorWheel(radius: i * 5)
                        .aspectRatio(2 / 3, contentMode: .fill)
                        .cornerRadius(5)
                }
                .asCarousel()

                // On edge modifiers

                HeaderPopover(
                    title: "On edge modifiers",
                    description: "Modifiers for reaching the leading and trailing edges"
                )
                .padding(.top, 30)
                .padding(.leading, 15)

                CollectionHStack(
                    0 ..< 10,
                    columns: 3
                ) { _ in
                    OnEdgeColorView(color: $onEdgeColor)
                }
                .onReachedLeadingEdge(offset: 10) {
                    withAnimation {
                        onEdgeColor = .blue
                    }
                }
                .onReachedTrailingEdge(offset: 10) {
                    withAnimation {
                        onEdgeColor = .pink
                    }
                }

                // Bouncing

                HStack {
                    HeaderPopover(
                        title: "Toggle bouncing",
                        description: "Enable/disable bouncing"
                    )

                    Spacer()

                    Button {
                        allowBouncing.toggle()
                    } label: {
                        Text(allowBouncing ? "Disable" : "Enable")
                            .font(.body.weight(.semibold))
                            .foregroundStyle(.secondary)
                            .padding(.trailing, 15)
                    }
                }
                .padding(.top, 30)
                .padding(.leading, 15)

                CollectionHStack(
                    0 ..< 20,
                    columns: 3
                ) { _ in
                    Color.blue
                        .aspectRatio(2 / 3, contentMode: .fill)
                        .cornerRadius(5)
                }
                .allowBouncing($allowBouncing)

                // Scrolling

                HStack {
                    HeaderPopover(
                        title: "Toggle scrolling",
                        description: "Enable/disable scrolling"
                    )

                    Spacer()

                    Button {
                        allowScrolling.toggle()
                    } label: {
                        Text(allowScrolling ? "Disable" : "Enable")
                            .font(.body.weight(.semibold))
                            .foregroundStyle(.secondary)
                            .padding(.trailing, 15)
                    }
                }
                .padding(.top, 30)
                .padding(.leading, 15)

                CollectionHStack(
                    0 ..< 20,
                    columns: 3
                ) { _ in
                    Color.blue
                        .aspectRatio(2 / 3, contentMode: .fill)
                        .cornerRadius(5)
                }
                .allowScrolling($allowScrolling)

                // Clips to bounds

                HeaderPopover(
                    title: "Clips to bounds",
                    description: "Disable clipping cells along the view's bounds"
                )
                .padding(.top, 30)
                .padding(.leading, 15)

                Text("Clipped (default)")
                    .padding(.leading, 15)

                CollectionHStack(
                    0 ..< 20,
                    columns: 3
                ) { _ in
                    Color.blue
                        .aspectRatio(2 / 3, contentMode: .fill)
                        .cornerRadius(5)
                        .shadow(
                            color: colorScheme == .light ? Color.black : Color.white,
                            radius: 10
                        )
                }

                Text("Not clipped")
                    .padding(.leading, 15)

                CollectionHStack(
                    0 ..< 20,
                    columns: 3
                ) { _ in
                    Color.blue
                        .aspectRatio(2 / 3, contentMode: .fill)
                        .cornerRadius(5)
                        .shadow(
                            color: colorScheme == .light ? Color.black : Color.white,
                            radius: 10
                        )
                }
                .clipsToBounds(false)
            }
        }
        .navigationTitle("Other")
    }
}
