//
//  PortfolioView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 13/01/25.
//

import SwiftUI
import Shimmer
import SocketIO

struct PortfolioView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject private var loginViewModel: AccountViewModel
    @State private var balanceLength: Int? = 0
    @State private var lastPriceUpdate: Int? = 0
    @State private var activeAds: Int? = 0
    @State private var selectedOption: String = "BTC"
    @State private var options: [String] = ["Option 1", "Option 2", "Option 3"]
    @State private var latestTotalAmount: String = ""
    @State private var total_gain_percentage: String = ""
    
    @State private var timer: Timer?
    
    var body: some View {
        ZStack {
            Color.whiteTextColor
                .ignoresSafeArea()
                .navigationBarBackButtonHidden()
            
            VStack(alignment: .leading) {
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Portfolio")
                                .foregroundStyle(Color.heading_Black_TextColor)
                                .font(.customfont(.bold, fontSize: 24))
                                .padding([.leading, .bottom], 10)
                        }
                        .frame(height: 50)
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(spacing: 2) {
                                Text("Total Balance")
                                    .foregroundStyle(Color.secondaryTextColor)
                                    .font(.customfont(.regular, fontSize: 10.5))
                                
                                Image("bottom_DropDown")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 10, height: 20)
                            }
                            HStack {
                                Text("$ 1000")
                                    .foregroundStyle(Color.heading_Black_TextColor)
                                    .font(.customfont(.regular, fontSize: 24))
                                Spacer()
                                Text("50 %")
                                    .foregroundStyle(Color.whiteTextColor)
                                    .font(.customfont(.medium, fontSize: 14))
                                    .frame(width: 80, height: 40)
                                    .background(getBackgroundColor(for: loginViewModel.total_gain_percentage))
                                    .cornerRadius(10)
                            }
                            HStack(spacing: 2) {
                                Text("You gained")
                                    .foregroundStyle(Color.greyColor)
                                    .font(.customfont(.regular, fontSize: 12))
                                
                                Text("$ 30")
                                    .foregroundStyle(getForegroundColor(for: loginViewModel.total_gain_usdt ?? ""))
                                    .font(.customfont(.regular, fontSize: 12))
                                Text("in October 2024")
                                    .foregroundStyle(Color.greyColor)
                                    .font(.customfont(.regular, fontSize: 12))
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 10)
                        
                        HStack {
                            UserAccountDetails(title: "Total Orders", totalCount: self.balanceLength ?? 0)
                            UserAccountDetails(title: "Last Price Update", totalCount: self.lastPriceUpdate ?? 0)
                            UserAccountDetails(title: "Active Ads", totalCount: self.activeAds ?? 0)
                        }
                        .padding(.top, 10)
                        .padding(.horizontal)
                        
                        VStack {
                            ForEach(loginViewModel.balance?.indices ?? 0..<0, id: \.self) { balance in
                                if let balanceData = loginViewModel.balance?[balance] {
                                    StockListView(balancedata: balanceData)
                                        .onAppear {
                                            self.balanceLength = loginViewModel.balance?.count ?? 0
                                        }
                                }
                            }
                        }
                        .padding(.top, 10)
                        .padding(.bottom, .bottomInsets + 70)
                    }
                }
                .clipped()
                .safeAreaTopPadding()
            }
            
            if loginViewModel.isLoading == true {
                    CircleLoader()
            }
        }
        .onAppear {
            //startTimer()
            loginViewModel.loadApiAccount()
        }
        .onDisappear {
            stopTimer()
        }
        .onReceive(loginViewModel.$total_balance_usdt) { newValue in
            self.latestTotalAmount = newValue ?? ""
        }
        .onReceive(loginViewModel.$total_gain_percentage) { newValue in
            self.total_gain_percentage = newValue ?? ""
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 8.0, repeats: true) { timerValue in
            loginViewModel.loadApiAccount()
            print("value change of timerValue \(timerValue)")
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    func getBackgroundColor(for value: String?) -> Color {
        guard let value = value, let number = Double(value.replacingOccurrences(of: "%", with: "")) else {
            return Color.gray
        }
        return number >= 0 ? Color.greenColor : Color.textRedColor
    }
    
    func getForegroundColor(for value: String?) -> Color {
        guard let value = value, !value.isEmpty else { return Color.gray }
        
        let trimmedValue = value.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedValue.hasPrefix("-") {
            return Color.textRedColor
        } else {
            return Color.greenColor
        }
    }
}

//#Preview {
//    PortfolioView()
//}
