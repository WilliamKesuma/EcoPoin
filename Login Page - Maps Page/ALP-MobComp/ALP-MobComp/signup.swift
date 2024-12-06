//
//  signup.swift
//  ALP-MobComp
//
//  Created by student on 06/12/24.
//

import SwiftUI

struct signup: View {
    let BrownColor = Color(red: 84/255, green: 71/255, blue: 63/255)
    let GreenColor = Color(red: 203/255, green: 210/255, blue: 165/255)
    let SoftBrownColor = Color(red: 154/255, green: 126/255, blue: 111/255)
    
    @State private var email: String = "livanty@gmail.com"
    @State private var password: String = "12345678"
    @State private var username: String = "LivLiv"
    @State private var confirmPassword: String = "12345678"
    @State private var isPasswordVisible: Bool = false;
    
    var body: some View {
        VStack {
                    // Welcome Text at the top
                    VStack(alignment: .leading) {
                        Text("logo goes here")
                            .padding(.leading)
                        Text("Let's create your account!")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(BrownColor)
                            .padding(.leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40)

                    // Main content inside the rectangle
                    ZStack {
                        RoundedRectangle(cornerRadius: 55)
                            .fill(Color.white)
                            .frame(height: 800)
                            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 3 / 6)
                        
                        VStack(spacing: 20) { // Add spacing between fields
                            // Username field
                            TextField("username", text: $username)
                                .padding(.horizontal, 16) // Padding inside the text field
                                .frame(maxWidth: 350, minHeight: 50) // Set width and height
                                .background(Color.gray.opacity(0.2)) // Light gray background
                                .cornerRadius(55) // Rounded corners
                            
                            // Email text field
                            TextField("user@mail.com", text: $email)
                                .padding(.horizontal, 16) // Padding inside the text field
                                .frame(maxWidth: 350, minHeight: 50) // Set width and height
                                .background(Color.gray.opacity(0.2)) // Light gray background
                                .cornerRadius(55) // Rounded corners
                                .keyboardType(.emailAddress) // Email keyboard type
                            
                            // Password field with toggle visibility
                            ZStack(alignment: .trailing) {
                                if isPasswordVisible {
                                    TextField("Enter your password", text: $password) // Show password as text
                                        .padding(.horizontal, 16)
                                        .frame(maxWidth: 350, minHeight: 50)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(55)
                                } else {
                                    SecureField("Enter your password", text: $password) // Hide password
                                        .padding(.horizontal, 16)
                                        .frame(maxWidth: 350, minHeight: 50)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(55)
                                }
                                
                                // Eye button to toggle visibility
                                Button(action: {
                                    isPasswordVisible.toggle()
                                }) {
                                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                        .foregroundColor(.gray)
                                }
                                .padding(.trailing, 16)
                            }
                            .frame(maxWidth: 350, minHeight: 50)
                            
                            // Confirm Password field
                            SecureField("Confirm your password", text: $confirmPassword)
                                .padding(.horizontal, 16)
                                .frame(maxWidth: 350, minHeight: 50)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(55)
                            
                            // Sign Up button
                            Button(action: {
                                print("Sign Up action")
                            }) {
                                Text("Sign Up")
                                    .padding(.horizontal, 16)
                                    .frame(maxWidth: 350, minHeight: 50)
                                    .background(SoftBrownColor)
                                    .cornerRadius(55)
                                    .foregroundColor(Color.white)
                                    .bold()
                            }
                            .padding(.horizontal)
                            
                            // Login with Google button
                            Button(action: {
                                print("Sign Up with Google")
                            }) {
                                Text("Sign Up with Google")
                                    .padding(.horizontal, 16)
                                    .frame(maxWidth: 350, minHeight: 50)
                                    .background(Color.red)
                                    .cornerRadius(55)
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            .padding(.horizontal)
                            
                            // Already have an account link
                            NavigationLink(destination: signin()) {
                                Text("Already have an account?")
                                    .foregroundColor(.blue)
                                    .underline()
                                    .padding(.top, 11)
                            }
                        }
                    }
                }
                .background(GreenColor)
            }
}

#Preview {
    signup()
}
