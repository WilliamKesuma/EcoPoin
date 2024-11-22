import SwiftUI

struct ContentView: View {
    // Sample list of rewards
    let rewards = [
        ("Wingstop Voucher", "Rp100,000 Wingstop Voucher", 1000),
        ("Pizza Voucher", "Rp50,000 Pizza Voucher", 500),
        ("Movie Ticket", "Cinema Ticket", 300),
        ("Gift Card", "Rp10,000 Gift Card", 10)
    ]
    
    var body: some View {
        NavigationStack { // Navigation container
            VStack {
                // Title Section
                Text("Your Points")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                // Points Display
                Text("19,051")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.top, 0)
                
                // Spacer between points and list
                Spacer().frame(height: 30)
                
                // List of Redeemable Items
                ScrollView {
                    VStack(spacing: 12) {  // Adjusted spacing between items
                        // Loop through the rewards array dynamically
                        ForEach(0..<rewards.count, id: \.self) { index in
                            NavigationLink(destination: RewardPage(rewardNumber: index)) {
                                HStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.gray.opacity(0.15))
                                        .frame(height: 70)
                                        .overlay(
                                            HStack {
                                                // Ticket Icon
                                                Image(systemName: "ticket.fill")
                                                    .resizable()
                                                    .frame(width: 30, height: 30)
                                                    .foregroundColor(.blue)
                                                    .padding(.leading, 16)
                                                
                                                // Reward Title
                                                Text(rewards[index].0)
                                                    .font(.headline)
                                                    .foregroundColor(.black)
                                                    .padding(.leading, 12)
                                                
                                                Spacer()
                                                
                                                // Star Icon
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .frame(width: 24, height: 24)
                                                    .foregroundColor(.yellow)
                                                    .padding(.trailing, 16)
                                            }
                                        )
                                }
                                .padding(.horizontal, 16)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                
                // Bottom Navigation Bar
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
            }
        }
    }
}

// Preview for ContentView
#Preview {
    ContentView()
}

