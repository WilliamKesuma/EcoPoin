import SwiftUI

struct RewardPage: View {
    var rewardNumber: Int
    
    // Example data for rewards. You can replace this with dynamic data if needed.
    let rewards = [
        ("Wingstop Voucher", "Rp100,000 Wingstop Voucher", 1000),
        ("Pizza Voucher", "Rp50,000 Pizza Voucher", 500),
        ("Movie Ticket", "Cinema Ticket", 300),
        ("Gift Card", "Rp10,000 Gift Card", 10)
    ]
    
    var body: some View {
        VStack {
            // Ensure the reward number is within bounds
            if rewardNumber < rewards.count {
                let reward = rewards[rewardNumber]
                
                // Display the selected reward
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(red: 203/255, green: 210/255, blue: 164/255))
                    .frame(height: 200)
                    .overlay(
                        VStack(spacing: 10) {
                            Text("Diskon \(reward.1)")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text(reward.0)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text("Syarat & ketentuan berlaku")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.8))
                        }
                        .padding()
                    )
                    .padding(.horizontal, 20)
                
                // About Voucher Section
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.red)
                            .frame(width: 20, height: 20)
                        Text("About Voucher")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    Text("Enjoy \(reward.1) with redeem \(reward.2) points.")
                        .font(.subheadline)
                        .foregroundColor(.black.opacity(0.7))
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)

                // Terms & Conditions Section
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "doc.text.fill")
                            .foregroundColor(.blue)
                            .frame(width: 20, height: 20)
                        Text("Terms & Conditions")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    Text("1. Redeem points by clicking 'REDEEM' button below")
                        .font(.subheadline)
                        .foregroundColor(.black.opacity(0.7))
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                Spacer()

                // Redeem Button Section
                VStack {
                    Text("Points are not enough")
                        .foregroundColor(.orange)
                        .font(.footnote)
                    
                    Button(action: {
                        // Action for redeem button
                        print("Redeem button tapped")
                    }) {
                        Text("REDEEM")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 20)
                    .disabled(true)
                }
                .padding(.bottom, 20)
            } else {
                Text("Invalid reward selection.")
                    .foregroundColor(.red)
            }
        }
        .background(Color.white.ignoresSafeArea())
    }
}

// Preview for RewardPage
#Preview {
    RewardPage(rewardNumber: 3) // Example for the first reward
}

