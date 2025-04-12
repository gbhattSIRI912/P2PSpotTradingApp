//
//  SearchView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 12/01/25.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var router: Router
    @State private var searchText: String = ""
    let cryptoData = [
        ("BNB", "Binance Coin", 671.72, "+0.75%", true),
        ("BTC", "Bitcoin", 95922.12, "-1.27%", false),
        ("ETH", "Ethereum", 671.72, "+0.75%", true),
        ("Doge", "Dogecoin", 671.72, "+0.75%", true),
        ("USUAL", "Usual", 671.72, "+0.75%", true),
        ("Doge", "Dogecoin", 671.72, "+0.75%", true),
        ("Doge", "Dogecoin", 671.72, "+0.75%", true)
    ]
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                // Search Bar
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .onTapGesture {
                            router.navigateBack()
                        }
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search", text: $searchText)
                            .padding(.vertical, 8)
                    }
                    .padding(.horizontal, 10)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.leading, 10)
                }
                .padding()
                
                // Crypto List
                List(
                    cryptoData.enumerated().filter {
                        $1.0.lowercased().contains(searchText.lowercased()) ||
                        $1.1.lowercased().contains(searchText.lowercased()) ||
                        searchText.isEmpty
                    }, id: \.0
                ) { index, crypto in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(crypto.0)
                                .font(.headline)
                            Text(crypto.1)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(String(format: "%.2f", crypto.2))
                                .font(.headline)
                            Text("$\(String(format: "%.2f", crypto.2))")
                                .font(.subheadline)
                                .foregroundColor(.green)
                        }
                        .padding(.trailing, 10)
                        
                        Text(crypto.3)
                            .padding(8)
                            .background(crypto.4 ? Color.green : Color.red)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 5)
                    .listRowSeparator(.hidden)
                }

                .listStyle(PlainListStyle())
            }
            .navigationBarHidden(true)
        }
    }
}


#Preview {
    SearchView()
}
