//
//  ContentView.swift
//  Account_ALP_EcoPoint
//
//  Created by student on 22/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var email: String = "Livanty@gmail.com"
    @State private var name: String = "Nana Nunu"
    @State private var language: String = "Indonesia"
    @State private var address: String = "Jl. Mau Hiling hue"
    @State private var provinceCityDistrict: String = "Jawa Timur\nSurabaya\nPakal\n60276"
    @State private var phoneNumber: String = "812 2947 7204"
    @State private var selectedTab: String = "Account"

    
    var body: some View {
        VStack {
            if selectedTab == "Home" {
                Text("Home View")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if selectedTab == "Location" {
                Text("Location View")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if selectedTab == "Ticket" {
                Text("Ticket View")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            } else if selectedTab == "Account" {
                NavigationView {
                    VStack {
                        // Profile Section
                        HStack {
                            Spacer()
                            VStack {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                            }
                            Spacer()
                        }
                        .padding(.top)
                        
                        // Form Fields
                        VStack(alignment: .leading, spacing: 15) {
                            // Email Field
                            Text("Email")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            TextField("Email", text: $email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                            
                            
                            // Name Field
                            Text("Name")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            TextField("Name", text: $name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            // Language Picker
                            Text("Language")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Picker("Language", selection: $language) {
                                Text("Indonesia").tag("Indonesia")
                                Text("English").tag("English")
                            }
                            .pickerStyle(MenuPickerStyle())
                            
                            // Address Field
                            Text("Address")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            TextField("Address", text: $address)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            // Province, City, District, Postal Code
                            Text("Province, City, District, Postal Code")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            TextField("Province, City, District, Postal Code", text: $provinceCityDistrict)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .lineLimit(nil)
                            
                            // Phone Number
                            Text("Phone Number")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            HStack {
                                Text("+62")
                                    .font(.body)
                                    .foregroundColor(.gray)
                                TextField("Phone Number", text: $phoneNumber)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.numberPad)
                            }
                        }
                        .padding(.horizontal)
                        
                        // Reset Password Button
                        Button(action: {
                            print("Reset Password Tapped")
                        }) {
                            Text("Reset Password")
                                .font(.footnote)
                                .foregroundColor(.brown)
                                .underline()
                        }
                        .padding(.bottom)
                    }
                    .navigationTitle("Account")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing:
                                            Button(action: {
                        print("Edit Profile tapped")
                    }) {
                        Text("Edit Profile")
                            .font(.footnote)
                            .foregroundColor(.green)
                            .padding(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.green, lineWidth: 1)
                            )
                    }
                    )
                }
            }
            
            // Custom Bottom Bar
            HStack {
                Spacer()
                Button(action: {
                    selectedTab = "Home"
                }) {
                    VStack {
                        Image(systemName: "house")
                            .font(.title)
                            .foregroundColor(selectedTab == "Home" ? .blue : .black)
                        Text("")
                            .font(.footnote)
                            .foregroundColor(selectedTab == "Home" ? .blue : .black)
                    }
                }
                Spacer()
                Button(action: {
                    selectedTab = "Location"
                }) {
                    VStack {
                        Image(systemName: "location")
                            .font(.title)
                            .foregroundColor(selectedTab == "" ? .blue : .black)
                        Text("")
                            .font(.footnote)
                            .foregroundColor(selectedTab == "" ? .blue : .black)
                    }
                }
                Spacer()
                Button(action: {
                    selectedTab = "Ticket"
                }) {
                    VStack {
                        Image(systemName: "ticket")
                            .font(.title)
                            .foregroundColor(selectedTab == "Ticket" ? .blue : .black)
                        Text("")
                            .font(.footnote)
                            .foregroundColor(selectedTab == "Ticket" ? .blue : .black)
                    }
                }
                Spacer()
                Button(action: {
                    selectedTab = "Account"
                }) {
                    VStack {
                        Image(systemName: "person")
                            .font(.title)
                            .foregroundColor(selectedTab == "Account" ? .blue : .black)
                        Text("")
                            .font(.footnote)
                            .foregroundColor(selectedTab == "Account" ? .blue : .black)
                    }
                }
                Spacer()
            }
            .padding()
            .background(Color(red: 203/255, green: 210/255, blue: 164/255))
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
