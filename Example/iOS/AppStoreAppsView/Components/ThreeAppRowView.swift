import CongruentScrollingHStack
import SwiftUI

extension AppStoreAppsView {
    struct ThreeAppRowView: View {

        let title: String
        let apps: [SampleApp]

        var body: some View {
            VStack(alignment: .leading) {

                LineDivider()
                    .padding(.horizontal, 18)

                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.leading, 18)

                CongruentScrollingHStack(
                    apps,
                    columns: 1,
                    rows: 3
                ) { app in
                    AppItem(app: app)
                }
                .scrollBehavior(.fullPaging)
                .horizontalInset(18)
                .itemSpacing(8)
            }
        }
    }
}
