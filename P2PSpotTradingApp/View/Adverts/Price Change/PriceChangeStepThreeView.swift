//
//  PriceChangeStepThreeView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 10/01/25.
//

import SwiftUI
import StepperView

struct PriceChangeStepThreeView: View {
    @EnvironmentObject var router: Router
    @State private var isSwitchLowestPrice: Bool = false
    @State private var isSwitchMarketPrice: Bool = false
    let indicators = [
        StepperIndicationType.custom(Image("Step_Success").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image("Step_Success").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image("Step_Shape").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image("Step_Number").font(.largeTitle).eraseToAnyView())
    ]
    
    @State private var floatingPrice: Int = 0
    @State private var txtAmount: String = "40000"
    
    var body: some View {
        ZStack {
            Color.whiteTextColor.ignoresSafeArea()
                .navigationBarBackButtonHidden()
            
            VStack {
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: 0)
                    .background(Color.whiteTextColor)
                ScrollView {
                    VStack(alignment: .leading) {
                        VStack {
                            HStack(alignment: .center, spacing: 0) {
                                StepperView()
                                    .addSteps([
                                        Text("Post An Advert")
                                            .font(.customfont(.regular, fontSize: 10))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .fixedSize(horizontal: true, vertical: false)
                                            .lineLimit(1),
                                        Text("Payment Methods")
                                            .font(.customfont(.regular, fontSize: 10))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .fixedSize(horizontal: true, vertical: false)
                                            .lineLimit(1),
                                        Text("Price Change")
                                            .font(.customfont(.regular, fontSize: 10))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .fixedSize(horizontal: true, vertical: false)
                                            .lineLimit(1),
                                        Text("T&C")
                                            .font(.customfont(.regular, fontSize: 10))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .fixedSize(horizontal: true, vertical: false)
                                            .lineLimit(1)
                                    ])
                                    .indicators(indicators)
                                    .stepIndicatorMode(StepperMode.horizontal)
                                    .lineOptions(StepperLineOptions.rounded(4, 8, Color.gray))
                                    .stepLifeCycles([StepLifeCycle.completed, .completed, .completed, .pending])
                                    .spacing(80)
                                    .frame(maxWidth: .infinity, maxHeight: 70, alignment: .center)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .screenHeight * 0.35, alignment: .center)
                            .padding(.top, .topInsets + 25)
                            .padding(.bottom, 10)
                        }
                        .background(Color.lightGreyColor)
                        .padding(.top, 20)
                        
                        Text("Price Change")
                            .font(.customfont(.regular, fontSize: 20))
                            .foregroundColor(Color.secondaryTextColor)
                            .padding(.horizontal, .horizontalInsets + 20)
                        
                        TotalAmountCustomView(title: "Base Price", amount: $txtAmount, currencyType: "BTC")
                        
                        HStack {
                            Text("Always Lowest Price")
                                .font(.customfont(.regular, fontSize: 16))
                                .foregroundColor(Color.secondaryTextColor)
                            Spacer()
                            
                            HStack(spacing: 10) {
                                Toggle(isOn: $isSwitchLowestPrice) {
                                    
                                }
                                .toggleStyle(SwitchToggleStyle(tint: .green))
                                .frame(width: 24, height: 24)
                                Text(isSwitchLowestPrice ? "ON" : "OFF")
                                    .font(.customfont(.regular, fontSize: 16))
                                    .foregroundColor(Color.secondaryTextColor)
                                    .padding(.leading, 12)
                            }
                            .padding(.trailing, 24)
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        MinimumPercantageLimits()
                        BasedOnSpecificUseView()
                        VStack {
                            ForEach(0...1, id: \.self) { item in
                                SearchListUsingPriceBases()
                            }
                        }
                        TotalAmountCustomView(title: "Set your price to always stay lower than Raj Verma", amount: $txtAmount, currencyType: "BTC")
                    }
                    .padding(.bottom, .bottomInsets)
                }
                .clipped()
                HStack(spacing: 20) {
                    CustomBackButtonView(title: "Back", didTap: {
                        router.navigateBack()
                    }, minWidth: .screenWidth * 0.4, maxWidth: .screenWidth * 0.4)
                    .padding(.leading, 20)
                    CustomButtonView(title: "Next", didTap: {
                        router.navigateTo(.termsAndConditionsView)
                    }, minWidth: .screenWidth * 0.4, maxWidth: .screenWidth * 0.4)
                    .padding(.trailing, 20)
                }
                .padding(.bottom, .bottomInsets + 20)
            }
        }
    }
}

#Preview {
    PriceChangeStepThreeView()
}
