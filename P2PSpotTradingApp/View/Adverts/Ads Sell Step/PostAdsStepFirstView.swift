//
//  PostAdsStepFirstView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 09/01/25.
//

import SwiftUI
import StepperView
import CryptoKit
import PKHUD

struct PostAdsStepFirstView: View {
    @EnvironmentObject var router: Router
    @State private var selectedSegment: String = "Sell"
    @State private var selectedSegmentValue: String? = "1"
    @State private var selectedSegmentFloating: String = "Floating"
    @State private var isSelectCrypoCurrency: Bool = false
    @State private var isSelectTradeCurrency: Bool = false
    @State private var adsTitle: String = "BNB"
    @State private var floatingPrice: Double = 0.0
    @State private var selectedPriceType: String = ""
    
    let indicators = [
        StepperIndicationType.custom(Image("Step_Shape").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image("Step_Number").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image("Step_Number").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image("Step_Number").font(.largeTitle).eraseToAnyView())
    ]
    let arrTradeCurrency = ["USD", "EUR", "GBP", "INR", "AUD", "CAD", "SGD", "JPY", "CNY", "CHF", "NZD", "ZAR", "AED", "SAR", "MYR", "THB", "KRW", "PKR", "BDT", "IDR", "VND", "BRL", "MXN", "RUB", "TRY", "EGP", "NGN", "KES", "ARS", "CLP", "COP", "PEN", "TWD", "NOK", "SEK", "DKK", "PLN", "HUF", "CZK", "RON", "ILS", "QAR", "KWD", "BHD", "OMR", "LKR", "UAH", "DZD ", "MAD"]
    @State private var tradeCurrency: String = "USD"
    @EnvironmentObject private var createAdsViewModel: CreateAdsViewModel
    @EnvironmentObject private var updateAdsViewModel: UpdateAdsViewModel
    
    var body: some View {
        ZStack {
            Color.whiteTextColor.ignoresSafeArea()
                .navigationBarBackButtonHidden()
            
            VStack {
                ScrollView {
                    VStack {
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
                        
                        Text("Post An Advert")
                            .font(.customfont(.regular, fontSize: 20))
                            .foregroundColor(Color.secondaryTextColor)
                            .padding(.top, 5)
                        
                        if #available(iOS 17.0, *) {
                            CustomSegmentedControl(selectedSegment: $selectedSegment, segments: ["Buy", "Sell"])
                                .padding(.horizontal)
                                .padding(.top, 10)
                                .onChange(of: selectedSegment) { newValue, oldvalue in
                                    if newValue == "Buy" {
                                        selectedSegmentValue = "2"
                                    } else {
                                        selectedSegmentValue = "1"
                                    }
                                }
                        } else {
                            // Fallback on earlier versions
                            CustomSegmentedControl(selectedSegment: $selectedSegment, segments: ["Buy", "Sell"])
                                .padding(.horizontal)
                                .padding(.top, 10)
                                .onChange(of: selectedSegment) { newValue in
                                    if newValue == "Buy" {
                                        selectedSegmentValue = "2"
                                    } else {
                                        selectedSegmentValue = "1"
                                    }
                                }
                        }
                        
                        CryptoCurrencyDropDownView(didTapCryptoCurrency: {
                            isSelectCrypoCurrency = true
                        }, didTapTradeCurrency: {
                            isSelectTradeCurrency = true
                        }, cryptoCurrency_Title: adsTitle, tradeCurrency: tradeCurrency)
                        .padding(.top, 10)
                        
                        if #available(iOS 17.0, *) {
                            CustomSegmentedControl(selectedSegment: $selectedSegmentFloating, segments: ["Fixed", "Floating"])
                                .padding(.horizontal)
                                .padding(.top, 10)
                                .onChange(of: selectedSegmentFloating) { oldSegment, newSegment in
                                    selectedPriceType = newSegment
                                    print(selectedPriceType)
                                }
                        } else {
                            // Fallback on earlier versions
                            CustomSegmentedControl(selectedSegment: $selectedSegmentFloating, segments: ["Fixed", "Floating"])
                                .padding(.horizontal)
                                .padding(.top, 10)
                                .onChange(of: selectedSegmentFloating) { newSegment in
                                    selectedPriceType = newSegment
                                    print(selectedPriceType)
                                }
                        }
                        
                        CustomFloatingPriceView(
                            title: $floatingPrice,
                            didTapAdd: {
                                floatingPrice += 0.1
                            },
                            didTapMinus: {
                                if floatingPrice > 0.0 {
                                    floatingPrice -= 0.1
                                }
                            },
                            selectedType: $selectedPriceType
                        )
                        .padding(.horizontal)
                        .padding(.top, 15)
                        
                        FloatingPriceView()
                    }
                }
                .clipped(antialiased: true)
                
                HStack(spacing: 20) {
                    CustomBackButtonView(title: "Back", didTap: {
                        router.navigateTo(.mainTabView)
                    }, minWidth: .screenWidth * 0.4, maxWidth: .screenWidth * 0.4)
                    .padding(.leading, 20)
                    .padding(.top, 5)
                    CustomButtonView(title: "Next", didTap: {
                        let errorMessage  = (selectedSegmentValue == "") ? "please select Trade type" : (adsTitle == "") ? "Please select crypto currency" : (tradeCurrency == "") ? "Please select Trade currency" : (selectedSegmentFloating == "") ? "Please select Price type" : ((selectedPriceType == "0") && (floatingPrice == 0.0)) ? "Please select price" : nil
                        
                        (errorMessage != nil) ? HUD.flash(.label(errorMessage!), delay: 1) : router.navigateTo(.postAdsStepTwoView)
                        
                        
                        
                    }, minWidth: .screenWidth * 0.4, maxWidth: .screenWidth * 0.4)
                    .padding(.trailing, 20)
                    .padding(.top, 5)
                }
                .padding(.bottom, .bottomInsets + 20)
            }
        }
        .fullScreenCover(isPresented: $isSelectCrypoCurrency, content: {
            CryptoCurrencyPopUpView(title: "Select Crypto Currency", isHidePopUpView: $isSelectCrypoCurrency, viewAds: $adsTitle, arrOrderList: ["BNB", "BTC", "TEH", "SOL", "DOGE", "XRP" , "PEPE", "ADA", "SUI", "GAS"], isComming: "Crypto Currency")
                .transition(.move(edge: .bottom))
                .background(AlmostTransparentDialogView())
        })
        .fullScreenCover(isPresented: $isSelectTradeCurrency, content: {
            CryptoCurrencyPopUpView(title: "Trade Currency/Fiat", isHidePopUpView: $isSelectTradeCurrency, viewAds: $tradeCurrency, arrOrderList: arrTradeCurrency, isComming: "Trade Currency")
                .transition(.move(edge: .bottom))
                .background(AlmostTransparentDialogView())
        })
    }
    
    
    
}

#Preview {
    PostAdsStepFirstView()
}
