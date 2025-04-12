//
//  OrderListingView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 07/01/25.
//

import SwiftUI

struct OrderListingView: View {
    @EnvironmentObject var listOrderListing: ListUserOrderHistoryViewModel
    @EnvironmentObject var router: Router
    @State private var selectedSegment = "Pending"
    @State private var selectedTab = "All"
    var tabs: [String] {
        selectedSegment == "Pending" ? ["All", "Unpaid", "Paid", "Appeal"] : ["All", "Completed", "Canceled"]
    }
    
    var filteredOrders: [UserOrderDataResponse] {
        guard let orders = listOrderListing.allOrderHistory else { return [] }
        
        let filteredBySegment = orders.filter { order in
            if selectedSegment == "Pending" {
                return order.status?.uppercased() == "UNPAID" ||
                order.status?.uppercased() == "PAID" ||
                order.status?.uppercased() == "APPEAL"
            } else if selectedSegment == "Completed" {
                return order.status?.uppercased() == "COMPLETED" ||
                order.status?.uppercased() == "CANCELED"
            }
            return false
        }
        
        if selectedTab != "All" {
            return filteredBySegment.filter { $0.status?.uppercased() == selectedTab.uppercased() }
        }
        return filteredBySegment
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.whiteTextColor.ignoresSafeArea()
                    .onAppear {
                        if listOrderListing.unauthorizedUser == 401 {
                            router.navigateTo(.loginView)
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            listOrderListing.loadApiAllOrderHistory()
                        }
                    }
                
                VStack {
                    // Top Section: Title
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Orders")
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundStyle(Color.secondaryTextColor)
                            .padding([.top, .leading])
                        
                        // Segmented Picker
                        if #available(iOS 17.0, *) {
                            CustomSegmentedControl(selectedSegment: $selectedSegment, segments: ["Pending", "Completed"])
                                .padding()
                                .onChange(of: selectedSegment) { oldSegment, newSegment in
                                    selectedTab = "All"
                                }
                        } else {
                            // earlier versions
                            CustomSegmentedControl(selectedSegment: $selectedSegment, segments: ["Pending", "Completed"])
                                .padding()
                                .onChange(of: selectedSegment) { oldSegment in
                                    selectedTab = "All"
                                }
                        }
                        
                        // Dynamic Tabs
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(tabs, id: \.self) { tab in
                                    TabButtonItem(title: tab, selectedTab: $selectedTab)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // Main Section: Orders List or No Data Message
                    if filteredOrders.isEmpty {
                        Spacer()
                        VStack(alignment: .center, spacing: 16) {
                            Image("receipt")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 111, height: 111)
                            Text("No \(selectedSegment.lowercased()) orders")
                                .font(.customfont(.medium, fontSize: 20))
                                .foregroundColor(Color.secondaryTextColor)
                        }
                        Spacer()
                        
                    } else {
                        List(filteredOrders.indices, id: \.self) { index in
                            let order = filteredOrders[index]
                            OrderCard(order: order)
                                .listRowSeparator(.hidden)
                        }
                        .listStyle(PlainListStyle())
                        .padding(.bottom, .bottomInsets + 65)
                    }
                }
                .safeAreaTopPadding()
                
                if listOrderListing.isLoading == true {
                    CircleLoader()
                }
            }
        }
    }
}

#Preview {
    OrderListingView()
}
