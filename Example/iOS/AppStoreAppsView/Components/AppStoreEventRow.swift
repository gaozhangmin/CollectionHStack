import CollectionHStack
import SwiftUI

extension AppStoreAppsView {

    struct AppStoreEventRow: View {

        let apps: [SampleApp]

        var body: some View {
            VStack(alignment: .leading) {

                Text("Events You Might Like")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.leading, 18)

                CollectionHStack(
                    apps,
                    columns: 1
                ) { app in
                    AppStoreEventRowCard(app: app)
                }
                .scrollBehavior(.fullPaging)
                .horizontalInset(18)
                .itemSpacing(8)
            }
        }
    }
}
