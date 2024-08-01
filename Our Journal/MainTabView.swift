import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            JournalView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Journal")
                }

            InspirationView()
                .tabItem {
                    Image(systemName: "lightbulb")
                    Text("Inspiration")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
