import SwiftUI

struct InspirationView: View {
    var body: some View {
        VStack {
            Text("Inspiration Tab")
                .font(.largeTitle)
                .foregroundColor(.orange)
                .padding()
        }
    }
}

struct InspirationView_Previews: PreviewProvider {
    static var previews: some View {
        InspirationView()
    }
}
