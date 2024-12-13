//
//  History.swift
//  Account_ALP_EcoPoint
//
//  Created by student on 22/11/24.
//
import SwiftUI

struct CombinedView: View {
    @State private var selectedSegment = 0
    @State private var selectedTab: String = "Account"
    
    @State private var email: String = "Livanty@gmail.com"
    @State private var name: String = "Nana Nunu"
    @State private var address: String = "Jl. Mau Hiling hue"
    @State private var provinceCityDistrict: String = "Jawa Timur\nSurabaya\nPakal\n60276"
    @State private var phoneNumber: String = "812 2947 7204"
    
    let segments = ["Account", "History"]
    
    var body: some View {
        VStack {
            // Segmented Picker
            Picker("", selection: $selectedSegment) {
                ForEach(0..<segments.count) { index in
                    Text(segments[index])
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.primary)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            // Content based on selected segment
            if selectedSegment == 0 {
                AccountView(email: $email, name: $name, address: $address, provinceCityDistrict: $provinceCityDistrict, phoneNumber: $phoneNumber)
            } else {
                HistoryView()
            }
            
            Spacer()
            
            // Bottom Navigation Bar
//            HStack {
//                Spacer()
//                Button(action: {
//                    selectedTab = "Home"
//                }) {
//                    VStack {
//                        Image(systemName: "house")
//                            .font(.title)
//                            .foregroundColor(selectedTab == "Home" ? .blue : .black)
//                        Text("")
//                            .font(.footnote)
//                            .foregroundColor(selectedTab == "Home" ? .blue : .black)
//                    }
//                }
//                Spacer()
//                Button(action: {
//                    selectedTab = "Location"
//                }) {
//                    VStack {
//                        Image(systemName: "location")
//                            .font(.title)
//                            .foregroundColor(selectedTab == "Location" ? .blue : .black)
//                        Text("")
//                            .font(.footnote)
//                            .foregroundColor(selectedTab == "Location" ? .blue : .black)
//                    }
//                }
//                Spacer()
//                Button(action: {
//                    selectedTab = "Ticket"
//                }) {
//                    VStack {
//                        Image(systemName: "ticket")
//                            .font(.title)
//                            .foregroundColor(selectedTab == "Ticket" ? .blue : .black)
//                        Text("")
//                            .font(.footnote)
//                            .foregroundColor(selectedTab == "Ticket" ? .blue : .black)
//                    }
//                }
//                Spacer()
//                Button(action: {
//                    selectedTab = "Account"
//                    selectedSegment = 0 // Switch back to "Account" segment
//                }) {
//                    VStack {
//                        Image(systemName: "person")
//                            .font(.title)
//                            .foregroundColor(selectedTab == "Account" ? .blue : .black)
//                        Text("")
//                            .font(.footnote)
//                            .foregroundColor(selectedTab == "Account" ? .blue : .black)
//                    }
//                }
//                Spacer()
//            }
//            .padding()
//            .background(Color(red: 203/255, green: 210/255, blue: 164/255))
        }
    }
}

struct AccountView: View {
    @Binding var email: String
    @Binding var name: String
    @Binding var address: String
    @Binding var provinceCityDistrict: String
    @Binding var phoneNumber: String
    
    var body: some View {
        NavigationView {
            VStack {
                // Profile Section
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .padding(.top)
                
                // Form Fields
                VStack(alignment: .leading, spacing: 17) {
                    // Email Field
                    Text("Email")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.gray)
                    TextField("Email", text: $email)
                        .padding(11) // Add padding for better spacing
                        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 1)) // Custom border style
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    // Name Field
                    Text("Name")
                    //                        .font(.subheadline)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.gray)
                    TextField("Name", text: $name)
                        .padding(11) // Add padding for better spacing
                        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 1)) // Custom border style
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    // Address Field
                    Text("Address")
                    //                        .font(.subheadline)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.gray)
                    TextField("Address", text: $address)
                        .padding(11) // Add padding for better spacing
                        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 1)) // Custom border style
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    // Province, City, District, Postal Code
                    Text("Province, City, District, Postal Code")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.gray)
                    TextField("Province, City, District, Postal Code", text: $provinceCityDistrict)
                        .padding(11) // Add padding for better spacing
                        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 1))
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .lineLimit(nil)
                    
                    // Phone Number
                    Text("Phone Number")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.gray)
                    HStack {
                        Text("+62")
                            .font(.body)
                            .foregroundColor(.gray)
                        TextField("Phone Number", text: $phoneNumber)
                            .padding(11) // Add padding for better spacing
                            .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 1)) // Custom border style
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
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
                }
                .padding(.bottom)
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                print("Edit Profile tapped")
            }) {
                Text("Edit Profile")
                    .foregroundColor(.black)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color(red: 203/255, green: 210/255, blue: 164/255))
                    )
            }
            )
        }
    }
}

struct HistoryView: View {
    var body: some View {
        VStack {
            Divider()
            
            // Total Points
            VStack {
                Text("Your Points")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("19,051")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.primary)
            }
            .padding()
            .background(Color(UIColor.systemGroupedBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            // History List
            ScrollView {
                VStack(spacing: 20) {
                    HistoryCard(
                        date: "15/11/2024",
                        dropOff: "10:00 AM, Lontar Surabaya",
                        pickUp: "6:00 PM, Wiyung Surabaya",
                        paperWaste: "2 KG",
                        plasticWaste: "2 KG",
                        liquidWaste: "2 Lt",
                        hazardousWaste: "0.5 KG",
                        points: "+15 Points"
                    )
                    
                    HistoryCard(
                        date: "14/11/2024",
                        dropOff: "10:00 AM, Lontar Surabaya",
                        pickUp: "6:00 PM, Wiyung Surabaya",
                        paperWaste: "5 KG",
                        plasticWaste: "2 KG",
                        liquidWaste: "1 Lt",
                        hazardousWaste: "0.5 KG",
                        points: "+20 Points"
                    )
                }
                .padding(.horizontal)
            }
            
            .padding()
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
}
struct HistoryCard: View {
    let date: String
    let dropOff: String
    let pickUp: String
    let paperWaste: String
    let plasticWaste: String
    let liquidWaste: String
    let hazardousWaste: String
    let points: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(date)
                .font(.subheadline)
                .bold()
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Drop Off").bold()
                    Text("Pick Up").bold()
                    Text("Paper Waste")
                    Text("Plastic Waste")
                    Text("Liquid Waste")
                    Text("Hazardous Waste")
                    Text("Points Collected").bold()
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 5) {
                    Text(dropOff)
                    Text(pickUp)
                    Text(paperWaste)
                    Text(plasticWaste)
                    Text(liquidWaste)
                    Text(hazardousWaste)
                    Text(points).foregroundColor(.green)
                }
            }
            .font(.footnote)
            .foregroundColor(.gray)
            .padding()
            //            .background(Color(UIColor.systemGroupedBackground))
            .background(Color(red: 203/255, green: 210/255, blue: 164/255))
            .cornerRadius(10)
        }
    }
}


struct CombinedView_Previews: PreviewProvider {
    static var previews: some View {
        CombinedView()
    }
}

