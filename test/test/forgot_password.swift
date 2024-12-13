//
//  forgot_password.swift
//  test
//
//  Created by student on 13/12/24.
//

import SwiftUI

struct forgot_password: View {
    let BrownColor = Color(red: 84/255, green: 71/255, blue: 63/255)
    let GreenColor = Color(red: 203/255, green: 210/255, blue: 165/255)
    let SoftBrownColor = Color(red: 154/255, green: 126/255, blue: 111/255)
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var confirmPassword: String = ""
    @State private var isPasswordVisible: Bool = false;
    
    var body: some View {
        VStack {
                    // Welcome Text at the top
                    VStack(alignment: .leading) {
                        Text("logo goes here")
                            .padding(.leading)
                        Text("Forgot your password? No worries!")
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

                            TextField("user@mail.com", text: $email)
                                .padding(.horizontal, 16) // Padding inside the text field
                                .frame(maxWidth: 350, minHeight: 50) // Set width and height
                                .background(Color.gray.opacity(0.2)) // Light gray background
                                .cornerRadius(55) // Rounded corners
                                .keyboardType(.emailAddress) // Email keyboard type
                            
                            .frame(maxWidth: 350, minHeight: 50)
                            
                            
                            // Sign Up button
                            NavigationLink(destination: signin()) {
                                Text("Reset Password")
                                    .padding(.horizontal, 16)
                                    .frame(maxWidth: 350, minHeight: 50)
                                    .background(SoftBrownColor)
                                    .cornerRadius(55)
                                    .foregroundColor(Color.white)
                                    .bold()
                            }
                            .padding(.horizontal)
                            
                            // Already have an account link
                            NavigationLink(destination: signin()) {
                                Text("Remember your password?")
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
    forgot_password()
}
