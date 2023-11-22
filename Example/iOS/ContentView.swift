import SwiftUI

struct ContentView: View {

    var body: some View {

        NavigationView {
            Form {
                Section("Features") {

                    NavigationLink("Color View") {
                        ColorView()
                    }
                }

                Section("Layout Recreations") {

                    NavigationLink("App Store Apps") {
                        Text("TODO")
                    }

                    NavigationLink("Apple Music Genre") {
                        MusicGenreView()
                    }

                    NavigationLink("Apple TV Home") {
                        Text("TODO")
                    }

                    NavigationLink("Books Book Store") {
                        Text("TODO")
                    }

                    NavigationLink("Podcasts Browse") {
                        Text("TODO")
                    }
                }
            }
            .navigationTitle("Example")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
