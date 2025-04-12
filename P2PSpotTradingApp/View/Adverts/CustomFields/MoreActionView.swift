//
//  MoreActionView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 08/01/25.
//

import SwiftUI

struct MoreActionView: View {
    @Binding var isHidePopUpView: Bool
    @State private var selectedIndex: Int = 0
    @Binding var viewAds: String
    @State private var arrOrder: [String] = ["Edit", "View More Details", "Close Ad"]
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.black)
                .opacity(0.5)
            VStack {
                HStack {
                    Text("More Action")
                        .font(.customfont(.bold, fontSize: 24))
                        .foregroundStyle(Color.secondaryTextColor)
                    Spacer()
                    Button(action: {
                        isHidePopUpView = false
                    }, label: {
                        Image("Cancel")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    })
                }
                .padding(.horizontal, 24)
                .padding([.top, .bottom], 10)
                
                ScrollView {
                    ForEach(arrOrder.indices, id: \.self) { item in
                        Text(arrOrder[item])
                            .padding(.leading, 10)
                            .frame(maxWidth: .infinity, minHeight: 45, maxHeight: 45, alignment: .leading)
                            .background(selectedIndex == item ? Color.lightGreyColor : Color.whiteTextColor)
                            .cornerRadius(8)
                            .padding(.horizontal, 24)
                            .foregroundColor(item == arrOrder.count - 1 ? Color.red : Color.black)
                            .onTapGesture {
                                viewAds = arrOrder[item]
                                selectedIndex = item
                                isHidePopUpView = false
                            }
                    }
                }
                .padding(.top, 5)
            }
            .frame(maxWidth: .infinity, maxHeight: 350)
            .background(Color.whiteTextColor)
            .cornerRadius(24)
            .shadow(radius: 10)
        }
    }
}

#Preview {
    MoreActionView(isHidePopUpView: .constant(false), viewAds: .constant(""))
}
