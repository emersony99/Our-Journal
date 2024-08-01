import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile Tab")
                .font(.largeTitle)
                .foregroundColor(.orange)
                .padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
