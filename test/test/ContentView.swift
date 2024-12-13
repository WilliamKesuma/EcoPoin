import SwiftUI

struct ContentView: View {
    let BrownColor = Color(red: 84/255, green: 71/255, blue: 63/255)
    let GreenColor = Color(red: 203/255, green: 210/255, blue: 165/255)
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Green background
                GreenColor
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    // Center content: Logo and text
                    VStack(spacing: 16) {
                        Text("🌿") // Replace with your logo
                            .font(.system(size: 80)) // Logo size
                        Text("Hi there! 👋")
                            .font(.title)
                            .foregroundColor(BrownColor)
                            .bold()
                        Text("Welcome to EcoPoin!")
                            .font(.title2)
                            .foregroundColor(BrownColor)
                    }
                    .padding(.bottom, 40) // Space above the half-circle
                    
                    Spacer()
                    
                    // Bottom content: Half-circle and button
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.width * 2)
                            .offset(y: UIScreen.main.bounds.width / 2) // Move circle down to create a half-circle
                        
                        NavigationLink(destination: signin()) {
                            Text("Let's get started!")
                                .padding(.horizontal, 16)
                                .frame(maxWidth: 350, minHeight: 50)
                                .background(BrownColor)
                                .cornerRadius(55)
                                .foregroundColor(.white)
                                .bold()
                        }
                        .padding(.bottom, UIScreen.main.bounds.height * 0.1) // Adjust button to bottom of the half-circle
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.5) // Restrict ZStack height for proper layout
                    .edgesIgnoringSafeArea(.bottom) // Ensure half-circle aligns with screen bottom
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

