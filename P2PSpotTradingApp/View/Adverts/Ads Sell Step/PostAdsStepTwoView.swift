//
//  PostAdsStepTwoView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 09/01/25.
//

import SwiftUI
import StepperView

struct PostAdsStepTwoView: View {
    @EnvironmentObject var router: Router
    @State private var isSelectAds: Bool = false
    @State private var adsTitle: String = "15 Mins"
    
    let indicators = [
        StepperIndicationType.custom(Image("Step_Success").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image("Step_Shape").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image("Step_Number").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image("Step_Number").font(.largeTitle).eraseToAnyView())
    ]
    @State private var isSelectPaymentMethod: Bool = false
    @State private var isCheckedValue: Bool = false
    @State private var selectedIndices: Set<Int> = [0]
    let arrPaymentMethod = ["Bank Transfers", "Credit Cards", "Debit Cards", "Ewallets", "CashU", "MoneyGram"]
    let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)
    
    var body: some View {
        ZStack {
            Color.whiteTextColor.ignoresSafeArea()
                .navigationBarBackButtonHidden()
            
            VStack {
                ScrollView {
                    VStack {
                        VStack {
                            HStack(alignment: .center, spacing: 0) {
                                //Stepper View
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
                        
                        Text("Trading Amounts & Payment Methods")
                            .font(.customfont(.regular, fontSize: 20))
                            .foregroundColor(Color.secondaryTextColor)
                        
                        TotalAmountAndOrderLimitView()
                        
                        //Payment method
                        VStack(alignment: .leading) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Payment Method")
                                        .font(.customfont(.regular, fontSize: 14))
                                        .foregroundColor(Color.secondaryTextColor)
                                    Text("Select a maximum of 3")
                                        .font(.customfont(.regular, fontSize: 12))
                                        .foregroundColor(Color.secondaryTextColor)
                                }
                                Spacer()
                                CustomButtonWithImageView(title: "Add", didTap: {
                                    isSelectPaymentMethod = true
                                }, minWidth: .screenWidth * 0.25, maxWidth: 0.25)
                                
                            }
                            .padding(.horizontal)
                            
                            LazyVGrid(columns: columns, spacing: 10) {
                                ForEach(selectedIndices.sorted(), id: \.self) { index in
                                    HStack(spacing: 2) {
                                        Image("Step_Shape")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 10, height: 10)
                                            .padding(.leading, 3)
                                        Text(arrPaymentMethod[index])
                                            .font(.customfont(.regular, fontSize: 10))
                                            .foregroundColor(Color.secondaryTextColor)
                                        Spacer()
                                        Button(action: {
                                            selectedIndices.remove(index)
                                        }) {
                                            Image("Cancel")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 10, height: 10)
                                        }
                                        .padding(.trailing, 8)
                                    }
                                    .frame(width: .screenWidth * 0.28, height: 30, alignment: .leading)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                                    .padding(.leading, 8)
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, 5)
                            Divider()
                                .padding(.horizontal)
                        }
                        .padding(.top, 10)
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Payment Time Limit")
                                .font(.customfont(.regular, fontSize: 14))
                                .foregroundColor(Color.secondaryTextColor)
                            //Payment Time Limit
                            Button(action: {
                                isSelectAds = true
                            }, label: {
                                HStack {
                                    Text(adsTitle)
                                        .font(.customfont(.regular, fontSize: 14))
                                        .foregroundColor(Color.secondaryTextColor)
                                        .padding(.leading, 10)
                                    Spacer()
                                    Image("bottom_DropDown")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 10, height: 20)
                                        .padding(.trailing, 10)
                                }
                                .frame(maxWidth: .infinity,minHeight: 40, maxHeight: 40)
                                .background(Color.lightGreyColor)
                                .cornerRadius(8)
                            })
                            
                            
                            
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        //Estimated Fee
                        EstimatedFeeView()
                    }
                }
                .clipped()
                //Bottom Button
                HStack(spacing: 20) {
                    CustomBackButtonView(title: "Back", didTap: {
                        router.navigateBack()
                    }, minWidth: .screenWidth * 0.4, maxWidth: .screenWidth * 0.4)
                    .padding(.leading, 20)
                    CustomButtonView(title: "Next", didTap: {
                        router.navigateTo(.priceChangeStepThreeView)
                    }, minWidth: .screenWidth * 0.4, maxWidth: .screenWidth * 0.4)
                    .padding(.trailing, 20)
                }
                .padding(.bottom, .bottomInsets + 15)
            }
        }
        .fullScreenCover(isPresented: $isSelectAds, content: {
            PaymentTimeLimitPopUpView(isHidePopUpView: $isSelectAds, viewAds: $adsTitle, arrPaymentTime: ["5 minutes", "10 minutes", "15 minutes", "20 minutes", "25 minutes", "30 minutes" , "35 minutes", "40 minutes", "45 minutes", "1 hour"])
                .transition(.move(edge: .bottom))
                .background(AlmostTransparentDialogView())
        })
        .fullScreenCover(isPresented: $isSelectPaymentMethod, content: {
            PaymentMethodList(isHidePopUpView: $isSelectPaymentMethod, arrPaymentMethod: arrPaymentMethod, selectedIndices: $selectedIndices)
                .transition(.move(edge: .bottom))
                .background(AlmostTransparentDialogView())
        })
    }
}

#Preview {
    PostAdsStepTwoView()
}
