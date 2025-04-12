//
//  MinimumPriceView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 10/01/25.
//

import SwiftUI

struct MinimumPriceView: View {
    var title: String
   @Binding var amount: Int
    var subHeading: String
    @Binding var otherPrice: Int
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundColor(Color.secondaryTextColor)
            HStack(spacing: 10) {
                HStack {
                    Button {
                        if amount > 0 {
                            self.amount -= 1
                        }
                    } label: {
                        Image("minus-cirlce")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .trailing)
                            .padding(.leading, 10)
                    }
                    
                    Spacer()
                    Text("\(amount)")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundStyle(Color.secondaryTextColor)
                    Spacer()
                    Button {
                        self.amount += 1
                    } label: {
                        
                        Image("add-circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .leading)
                            .padding(.trailing, 10)
                    }
                }
                .frame(width: .screenWidth * 0.4, height: 45)
                .background(Color.lightGreyColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.boarderColor, lineWidth: 0.5)
                )
                
                Text("To")
                    .font(.customfont(.bold, fontSize: 18))
                    .foregroundStyle(Color.secondaryTextColor)
                
                HStack {
                    Button {
                        self.otherPrice -= 1
                    } label: {
                        Image("minus-cirlce")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .trailing)
                            .padding(.leading, 10)
                    }
                    
                    Spacer()
                    Text("\(otherPrice)")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundStyle(Color.secondaryTextColor)
                    Spacer()
                    Button {
                        self.otherPrice += 1
                    } label: {
                        
                        Image("add-circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .leading)
                            .padding(.trailing, 10)
                    }
                }
                .frame(width: .screenWidth * 0.4, height: 45)
                .background(Color.lightGreyColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.boarderColor, lineWidth: 0.5)
                )
            }
            Text(subHeading)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundColor(Color.secondaryTextColor)
            
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}

struct MinimumPriceAccordingToPercentageView: View {
    var title: String
    @Binding var amount: Double
    var subHeading: String
    @Binding var otherPrice: Double
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundColor(Color.secondaryTextColor)
            HStack(spacing: 10) {
                HStack {
                    Button {
                        if amount > 0.0 {
                            self.amount -= 0.1
                        }
                    } label: {
                        Image("minus-cirlce")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .trailing)
                            .padding(.leading, 10)
                    }
                    
                    Spacer()
                    Text(String(format: "%.2f %%", amount))
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundStyle(Color.secondaryTextColor)
                    Spacer()
                    Button {
                        self.amount += 0.1
                    } label: {
                        
                        Image("add-circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .leading)
                            .padding(.trailing, 10)
                    }
                }
                .frame(width: .screenWidth * 0.4, height: 45)
                .background(Color.lightGreyColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.boarderColor, lineWidth: 0.5)
                )
                
                Text("To")
                    .font(.customfont(.bold, fontSize: 18))
                    .foregroundStyle(Color.secondaryTextColor)
                
                HStack {
                    Button {
                        self.otherPrice -= 0.1
                    } label: {
                        Image("minus-cirlce")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .trailing)
                            .padding(.leading, 10)
                    }
                    
                    Spacer()
                    Text(String(format: "%.2f %%", otherPrice))
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundStyle(Color.secondaryTextColor)
                    Spacer()
                    Button {
                        self.otherPrice += 0.1
                    } label: {
                        
                        Image("add-circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .leading)
                            .padding(.trailing, 10)
                    }
                }
                .frame(width: .screenWidth * 0.4, height: 45)
                .background(Color.lightGreyColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.boarderColor, lineWidth: 0.5)
                )
            }
            Text(subHeading)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundColor(Color.secondaryTextColor)
            
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}

struct MarketAverageThresholdView: View {
    var title: String
   @Binding var amount: Int
    var subHeading: String
    @Binding var otherPrice: Int
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundColor(Color.secondaryTextColor)
            HStack(spacing: 10) {
                HStack {
                    Button {
                        if amount > 0 {
                            self.amount -= 1
                        }
                    } label: {
                        Image("minus-cirlce")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .trailing)
                            .padding(.leading, 10)
                    }
                    
                    Spacer()
                    Text("\(amount)")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundStyle(Color.secondaryTextColor)
                    Spacer()
                    Button {
                        self.amount += 1
                    } label: {
                        
                        Image("add-circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .leading)
                            .padding(.trailing, 10)
                    }
                }
                .frame(width: .screenWidth * 0.4, height: 45)
                .background(Color.lightGreyColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.boarderColor, lineWidth: 0.5)
                )
                
                Text("To")
                    .font(.customfont(.bold, fontSize: 18))
                    .foregroundStyle(Color.secondaryTextColor)
                
                HStack {
                    Button {
                        self.otherPrice -= 1
                    } label: {
                        Image("minus-cirlce")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .trailing)
                            .padding(.leading, 10)
                    }
                    
                    Spacer()
                    Text("\(otherPrice)")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundStyle(Color.secondaryTextColor)
                    Spacer()
                    Button {
                        self.otherPrice += 1
                    } label: {
                        
                        Image("add-circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .leading)
                            .padding(.trailing, 10)
                    }
                }
                .frame(width: .screenWidth * 0.4, height: 45)
                .background(Color.lightGreyColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.boarderColor, lineWidth: 0.5)
                )
            }
            Text(subHeading)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundColor(Color.secondaryTextColor)
            
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}

//#Preview {
//    MinimumPriceView(title: "", amount: "", subHeading: "", otherPrice: "")
//}
