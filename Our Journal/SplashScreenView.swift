import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
            ContentView()
                .preferredColorScheme(.dark)
        } else {
            VStack {
                VStack {
                    Image("splashlogo") // Use your own logo image
                        .resizable() // Make the image resizable
                        .scaledToFit() // Scale the image to fit its container
                        .frame(width: 200, height: 100) // Adjust the size as needed
                    Text("Our Journal")
                        .font(Font.custom("Baskerville-Bold", size: 26))
                        .foregroundColor(.white.opacity(0.9))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 3)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        self.size = 2.0
                        self.opacity = 0.0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
