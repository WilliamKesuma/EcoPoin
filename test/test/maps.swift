import SwiftUI
import MapKit

struct maps: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Example: San Francisco
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var showFullScreenMap = false
    @State private var showDetails = false // Controls bottom sheet visibility
    @State private var searchQuery = ""
    @State private var searchHistory: [String] = [
        "Location A",
        "Location B",
        "Location C",
        "Location D",
        "Location E",
        "Location F",
        "Location G"
    ]

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                // Header
                HStack {
                    VStack(alignment: .leading) {
                        Text("Nearby drop-off points")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("We'll look for nearby drop-off points available for you. Sit tight!")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Circle()
                        .fill(Color.black) // tba change to location icon
                        .frame(width: 60, height: 60)
                }
                .padding()

                // Map
                Map(coordinateRegion: $region, showsUserLocation: true)
                    .frame(height: 250)
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .onTapGesture {
                        withAnimation {
                            showDetails.toggle()
                        }
                    }

                // Search Bar
                HStack {
                    TextField("Search for location...", text: $searchQuery, onCommit: {
                        if !searchQuery.isEmpty {
                            searchHistory.insert(searchQuery, at: 0) // Add new query to the top
                            searchQuery = ""
                        }
                    })
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding()

                // Search History
                Text("Search History")
                    .font(.headline)
                    .padding(.horizontal)

                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(searchHistory, id: \.self) { historyItem in
                            HStack {
                                Image(systemName: "clock")
                                    .foregroundColor(.gray)
                                Text(historyItem)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                    }
                }
                .frame(maxHeight: 200) // Limit scrollable area height

                Spacer()

                // Bottom Navigation
                HStack {
                    Spacer()
                    Image(systemName: "house")
                        .font(.title)
                    Spacer()
                    Image(systemName: "location")
                        .font(.title)
                    Spacer()
                    Image(systemName: "ticket")
                        .font(.title)
                    Spacer()
                    Image(systemName: "person")
                        .font(.title)
                    Spacer()
                }
                .padding()
                .background(Color(red: 203/255, green: 210/255, blue: 164/255))
                .cornerRadius(20)
                .ignoresSafeArea()
            }

            // Bottom Sheet for Details
            if showDetails {
                BottomSheetView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Your current location")
                            .font(.caption)
                            .foregroundColor(.gray)

                        Text("San Jose International Airport")
                            .font(.system(size: 10))
                            .fontWeight(.bold)

                        Text("Mineta San José International Airport")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        Text("International Airport · San Jose, California")
                            .font(.footnote)
                            .foregroundColor(.gray)

                        HStack {
                            Text("There are currently 6 nearby trashbins")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Image(systemName: "checkmark")
                                .foregroundColor(.green)
                        }

                        Spacer()

                        Button(action: {
                            withAnimation {
                                showDetails = false
                            }
                        }) {
                            Text("Use this location")
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(red: 203/255, green: 210/255, blue: 164/255))
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                }
            }
        }
        .sheet(isPresented: $showFullScreenMap) {
            FullScreenMapView(region: $region)
        }
    }
}

// Bottom Sheet View
struct BottomSheetView<Content: View>: View {
    var content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack {
            Spacer()// Pushes the sheet to the bottom
            VStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 40, height: 5)
                    .padding(.vertical, 10)

                content
            }
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
        }
        .transition(.move(edge: .bottom)) // Slide-in animation
    }
}

// Full-Screen Map View
struct FullScreenMapView: View {
    @Binding var region: MKCoordinateRegion
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            Map(coordinateRegion: $region, showsUserLocation: true)
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("Map")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Close") {
                            dismiss()
                        }
                    }
                }
        }
    }
}

struct maps_Previews: PreviewProvider {
    static var previews: some View {
        maps()
    }
}
