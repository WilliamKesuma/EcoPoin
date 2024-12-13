//
//  home_page.swift
//  test
//
//  Created by student on 13/12/24.
//

import SwiftUI

struct home_page: View {
    var body: some View {
        VStack(alignment: .leading) {
            // Header
            HStack {
                VStack(alignment: .leading) {
                    Text("Good Morning, user!")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Have you throw out your trash?")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Circle()
                    .fill(Color.black) // Placeholder for profile image
                    .frame(width: 60, height: 60)
            }
            .padding()
            
            // Search Bar
            HStack {
                TextField("Search for trashes...", text: .constant(""))
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            
            // Waste Categories
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 16) {
                ForEach(1...6, id: \.self) { index in
                    WasteCard(title: getTitle(for: index))
                }
            }
            .padding()
            
            Spacer()
            
            // Bottom Navigation
            HStack {
                Spacer()
                Image(systemName: "house")
                    .font(.title)
                Spacer()
                NavigationLink(destination: maps()) {
                    Image(systemName: "location")
                        .font(.title)
                }
                Spacer()
                NavigationLink(destination: ticket_page()) {
                    Image(systemName: "ticket")
                        .font(.title)
                }
                Spacer()
                NavigationLink(destination: CombinedView()) {
                    Image(systemName: "person")
                        .font(.title)
                }
                Spacer()
            }
            .padding()
            .background(Color(red: 203/255, green: 210/255, blue: 164/255))
        }
    }
    
    // Function to get title based on index
    func getTitle(for index: Int) -> String {
        let titles = ["Paper waste", "Plastic waste", "Oil waste", "Bottled waste", "Paper waste", "Paper waste"]
        return titles[index - 1]
    }
}

struct WasteCard: View {
    var title: String
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.black) // Placeholder for image
                .frame(height: 100)
            Text(title)
                .font(.headline)
            ProgressBar(value: 0.5) // Placeholder for progress bar
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ProgressBar: View {
    var value: CGFloat // Progress value
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 5)
                    .foregroundColor(Color.gray.opacity(0.2))
                Rectangle()
                    .frame(width: geometry.size.width * value, height: 5)
                    .foregroundColor(.green)
            }
            .cornerRadius(2.5)
        }
        .frame(height: 5)
    }
}

#Preview {
    home_page()
}
