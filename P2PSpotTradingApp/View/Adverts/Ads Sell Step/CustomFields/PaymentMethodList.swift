//
//  PaymentMethodList.swift
//  P2PSpotTradingApp
//
//  Created by orange on 20/01/25.
//

import SwiftUI

struct PaymentMethodList: View {
    @Binding var isHidePopUpView: Bool
    var arrPaymentMethod: [String] = []
    @Binding var selectedIndices: Set<Int>
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.5)
            
            VStack {
                HStack {
                    Text("Payment Method")
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
                    ForEach(arrPaymentMethod.indices, id: \.self) { item in
                        HStack(spacing: 4) {
                            Button(action: {
                                if selectedIndices.contains(item) {
                                    selectedIndices.remove(item)
                                } else if selectedIndices.count < 3 {
                                    selectedIndices.insert(item)
                                }
                            }) {
                                Image(selectedIndices.contains(item) ? "Selected_CheckBox" : "UnselectedCheck")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .foregroundColor(.blue)
                           
                            Text(arrPaymentMethod[item])
                                .font(.customfont(.regular, fontSize: 14))
                                .foregroundStyle(Color.secondaryTextColor)
                                
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .background(selectedIndices.contains(item) ? Color.lightGreyColor : Color.whiteTextColor)
                        .cornerRadius(8)
                        .padding(.horizontal, 24)
                    }
                }
                .padding(.top, 5)
            }
            .frame(maxWidth: .infinity, maxHeight: 400)
            .background(Color.whiteTextColor)
            .cornerRadius(24)
            .shadow(radius: 10)
        }
        .background(AlmostTransparentDialogView())
        .transition(.move(edge: .bottom))
        .ignoresSafeArea()
    }
}


#Preview {
    PaymentMethodList(isHidePopUpView: .constant(false), selectedIndices: .constant([0, 1]))
}
