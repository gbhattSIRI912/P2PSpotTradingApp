//
//  SellingPriceTopView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 08/01/25.
//

import SwiftUI

struct PriceSelectorView: View {
    @State private var selectedOption: String = "15" // Default selected option
    
    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 2) {
                Text("Best Sell Price")
                    .font(.system(size: 10)) // Smaller font size
                    .foregroundColor(.gray)
                Text("374187.63")
                    .font(.system(size: 14, weight: .semibold)) // Adjusted size
                    .foregroundColor(.red)
            }
            .padding(.leading, 20)
            
            VStack(alignment: .center, spacing: 2) {
                Text("Best Buy Price")
                    .font(.system(size: 10)) // Smaller font size
                    .foregroundColor(.gray)
                Text("390000.00")
                    .font(.system(size: 14, weight: .semibold)) // Adjusted size
                    .foregroundColor(.green)
            }
            .padding(.leading, 30)
            
            Spacer()
            
            HStack(spacing: 8) {
                ForEach(["All", "10", "15", "20"], id: \.self) { option in
                    Button(action: {
                        selectedOption = option
                    }) {
                        Text(option)
                            .font(.system(size: 12)) // Adjusted font size
                            .frame(width: 26, height: 20) // Fixed button size
                            .background(selectedOption == option ? Color.black : Color.clear)
                            .foregroundColor(selectedOption == option ? .white : .black)
                            .cornerRadius(5) // Adjusted corner radius
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(selectedOption == option ? Color.black : Color.gray, lineWidth: 1)
                            )
                    }
                }
            }
            .padding(.trailing, 10)
        }
        .frame(height: 50)
        .padding(.horizontal, 8)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}


#Preview {
    PriceSelectorView()
}
