import SwiftUI

struct login: View {
    let BrownColor = Color(red: 84/255, green: 71/255, blue: 63/255)
    let GreenColor = Color(red: 203/255, green: 210/255, blue: 165/255)
    let SoftBrownColor = Color(red: 154/255, green: 126/255, blue: 111/255)
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        ZStack {
            GreenColor.ignoresSafeArea()
            VStack(spacing: 20) {
                
                // Title section
                Text("EcoPoin logo goes here")
                Text("Welcome to EcoPoin!")
                    .font(.title)
                    .foregroundColor(BrownColor)
                
                VStack {
                    // Email text field
                    TextField("user@mail.com", text: $email)
                        .padding(12)
                        .frame(maxWidth: 300)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.top, 20)
                        .keyboardType(.emailAddress)
                    
                    // Password field with toggle visibility
                    ZStack(alignment: .trailing) {
                        if isPasswordVisible {
                            TextField("Enter your password", text: $password) // Show password as text
                                .padding(12)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .frame(maxWidth: 300)
                                .padding(.top, 20)
                        } else {
                            SecureField("Enter your password", text: $password) // Hide password
                                .padding(12)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .frame(maxWidth: 300)
                                .padding(.top, 20)
                        }
                        
                        Button(action: {
                            // Toggle the visibility of the password
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye") // Eye icon for visibility toggle
                                .foregroundColor(.gray)
                                .padding(.top, 20)
                                .padding(.trailing, 2) // Adjust the padding to place the icon inside
                        }
                        .padding(.trailing, 12) // Adjust position of the button inside the field
                    }
                    
                    // Login button
                    Button(action: {
                        print("to home page")
                    }) {
                        Text("Login")
                            .font(.headline)
                            .frame(maxWidth: 100)
                            .padding()
                            .background(BrownColor)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .padding(.horizontal)
                    }
                    .padding(.top, 50)
                    .padding(.horizontal)
                    
                    // Forgot password button
                    VStack {
                        Button(action: {
                            print("to forgot password")
                        }) {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .foregroundColor(.blue)
                                .underline()
                        }
                    }
                    .padding(.top, 10)
                    
            }
            .padding()
        }
    }
        HStack {
            Text("Don't have an account? ")
            Text("Sign Up")
                .font(.headline)
                .foregroundColor(BrownColor)
                .underline()
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    login()
}
