//
//  OrderCard.swift
//  P2PSpotTradingApp
//
//  Created by orange on 20/01/25.
//

import SwiftUI

struct OrderCard: View {
    let order: UserOrderDataResponse?//OrderHistoryDataModel?
    
    var body: some View {
       /* VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(order?.symbol ?? "") \(order?.side ?? "")")
                    .font(.customfont(.medium, fontSize: 14))
                    .foregroundStyle(Color.secondaryTextColor)
                Spacer()
                HStack {
                    /*if (order.status == "Appeal") {
                     Button(action: {}, label: {
                     HStack(spacing: 5) {
                     Image("ChatCenteredText")
                     .resizable()
                     .scaledToFit()
                     .frame(width: 13, height: 13)
                     Text("Chat")
                     .font(.customfont(.regular, fontSize: 14))
                     .foregroundStyle(Color.primary)
                     }
                     
                     })
                     }*/
                    
                    Text(order?.status ?? "")
                        .font(.customfont(.medium, fontSize: 11))
                        .foregroundColor(orderStatusColor(order?.status ?? ""))
                        .padding([.horizontal], 10)
                        .padding([.vertical], 5)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(orderStatusColor(order?.status ?? ""), lineWidth: 0.5)
                        }
                }
                
            }
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    let quantity = order?.symbol?.prefix(3)
                    Text("Quantity: \(order?.quantity ?? "") \(quantity ?? "")")
                        .font(.customfont(.regular, fontSize: 11))
                        .foregroundStyle(Color.secondaryTextColor)
                    Spacer()
                    HStack(spacing: 5) {
                        ZStack {
                            Circle()
                                .fill(Color.colorCircleBackground)
                                .frame(width: 20, height: 20)
                            
                            Text("\("Raj".first?.uppercased() ?? "")")
                                .font(.customfont(.medium, fontSize: 10))
                                .foregroundColor(Color.heading_Black_TextColor)
                        }
                        
                        Text("raj")
                            .foregroundStyle(Color.secondaryTextColor)
                            .font(.customfont(.medium, fontSize: 14))
                        Image("Right_Yellow")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 13, height: 13)
                    }
                }
                VStack(alignment: .leading) {
                    HStack {
                        if let price = Double(order?.updated_price ?? "") {
                            Text("Price: \(String(format: "$ %.2f", price))")
                                .font(.customfont(.regular, fontSize: 11))
                                .foregroundStyle(Color.secondaryTextColor)
                        }
                        
                        Spacer()
                        
                        if let price = Double(order?.totalQuote ?? "") {
                            Text("\(String(format: "$ %.2f", price))")
                                .font(.customfont(.regular, fontSize: 20))
                                .foregroundStyle(Color.secondaryTextColor)
                                .frame(alignment: .leading)
                        }
                    }
                }
                
                HStack {
                    Text("Order: \(order?.orderId ?? 0)")
                        .font(.customfont(.regular, fontSize: 11))
                        .foregroundStyle(Color.secondaryTextColor)
                    Spacer()
                    VStack(alignment: .leading) {
                        if let formattedDate = formatDateString(order?.time ?? "") {
                            /*Text("\(convertTimestampToDate(timestamp: Double(order?.createTime ?? 0)))" )*/
                            Text("\(formattedDate)")
                                .font(.customfont(.regular, fontSize: 11))
                                .foregroundStyle(Color.secondaryTextColor)
                                .frame(alignment: .leading)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.greyColor, lineWidth: 0.5)
        }*/
        VStack {
            HStack {
                Text("\(order?.symbol ?? "") \(order?.side ?? "")")
                    .font(.customfont(.medium, fontSize: 14))
                    .foregroundStyle(Color.secondaryTextColor)
                Spacer()
                HStack {
                    /*if (order.status == "Appeal") {
                     Button(action: {}, label: {
                     HStack(spacing: 5) {
                     Image("ChatCenteredText")
                     .resizable()
                     .scaledToFit()
                     .frame(width: 13, height: 13)
                     Text("Chat")
                     .font(.customfont(.regular, fontSize: 14))
                     .foregroundStyle(Color.primary)
                     }
                     
                     })
                     }*/
                    
                    Text(order?.status ?? "")
                        .font(.customfont(.medium, fontSize: 11))
                        .foregroundColor(orderStatusColor(order?.status ?? ""))
                        .padding([.horizontal], 10)
                        .padding([.vertical], 5)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(orderStatusColor(order?.status ?? ""), lineWidth: 0.5)
                        }
                }
                
            }
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    let quantity = order?.symbol?.prefix(3)
                    HStack(spacing: 0) {
                        Text("Quantity: ")
                            .font(.customfont(.regular, fontSize: 11))
                            .foregroundStyle(Color.secondaryTextColor)
                        Text("\(order?.quantity ?? "") \(quantity ?? "")")
                            .font(.customfont(.medium, fontSize: 12))
                            .foregroundStyle(Color.secondaryTextColor)
                    }
                    
                    
                    if let price = Double(order?.updated_price ?? "") {
                        HStack(spacing: 0) {
                            Text("Price: ")
                                .font(.customfont(.regular, fontSize: 11))
                                .foregroundStyle(Color.secondaryTextColor)
                            Text("\(String(format: "$ %.2f", price))")
                                .font(.customfont(.medium, fontSize: 12))
                                .foregroundStyle(Color.secondaryTextColor)
                        }
                    }
                    
                    HStack(spacing: 0) {
                        Text("Order: ")
                            .font(.customfont(.regular, fontSize: 11))
                            .foregroundStyle(Color.secondaryTextColor)
                        
                        Text("\(order?.orderId ?? 0)")
                            .font(.customfont(.medium, fontSize: 12))
                            .foregroundStyle(Color.secondaryTextColor)
                        
                    }
                    
                }
                Spacer()
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 5) {
                        ZStack {
                            Circle()
                                .fill(Color.colorCircleBackground)
                                .frame(width: 20, height: 20)
                            
                            Text("\("Raj".first?.uppercased() ?? "")")
                                .font(.customfont(.medium, fontSize: 10))
                                .foregroundColor(Color.heading_Black_TextColor)
                        }
                        
                        Text("raj")
                            .foregroundStyle(Color.secondaryTextColor)
                            .font(.customfont(.medium, fontSize: 14))
                        Image("Right_Yellow")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 13, height: 13)
                    }
                        
                    VStack(alignment: .leading) {
                        if let price = Double(order?.totalQuote ?? "") {
                            Text("\(String(format: "$ %.2f", price))")
                                .font(.customfont(.regular, fontSize: 20))
                                .foregroundStyle(Color.secondaryTextColor)
                                .frame(alignment: .leading)
                        }
                        
                        if let formattedDate = formatDateString(order?.time ?? "") {
                            /*Text("\(convertTimestampToDate(timestamp: Double(order?.createTime ?? 0)))" )*/
                            Text("\(formattedDate)")
                                .font(.customfont(.regular, fontSize: 11))
                                .foregroundStyle(Color.secondaryTextColor)
                                .frame(alignment: .leading)
                        }
                       
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.greyColor, lineWidth: 0.5)
        }
    }
    
    // Function to determine the color of the status
    func orderStatusColor(_ status: String) -> Color {
        switch status {
        case "COMPLETED":
            return Color.primaryButtonColor
        case "CANCELED":
            return Color.textRedColor
        case "Unpaid":
            return Color.textRedColor
        case "Paid":
            return Color.primaryButtonColor
        case "Appeal":
            return Color.orange
        default:
            return .gray
        }
    }
}

#Preview {
    OrderCard(order: UserOrderDataResponse(symbol: "", orderId: 0, price: "", updated_price: "", quantity: "", executedQty: "", totalQuote: "", status: "", orderType: "", side: "", time: "", updateTime: ""))
}
