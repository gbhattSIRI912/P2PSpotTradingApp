//
//  TermsAndConditionsView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 10/01/25.
//

import SwiftUI
import StepperView
import PKHUD

struct TermsAndConditionsView: View {
    @EnvironmentObject var router: Router
    let indicators = [
        StepperIndicationType.custom(Image("Step_Success").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image("Step_Success").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image("Step_Success").font(.largeTitle).eraseToAnyView()),
        StepperIndicationType.custom(Image("Step_Shape").font(.largeTitle).eraseToAnyView())
    ]
    
    @State private var txtTerms: String = ""
    @State private var txtAutoReply: String = ""
    let kycSteps: [KYCStep] = [
        KYCStep(imageName: "CheckCircle", text: "Completed KYC"),
        KYCStep(imageName: "CheckCircle", text: "Pending KYC"),
        KYCStep(imageName: "CheckCircle", text: "Failed Verification"),
        KYCStep(imageName: "CheckCircle", text: "Verified Account")
    ]
    @State private var isSelectedPublished: Bool = false
    var body: some View {
        ZStack {
            Color.whiteTextColor.ignoresSafeArea()
                .navigationBarBackButtonHidden()
            
            
            VStack {
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: 0)
                    .background(Color.whiteTextColor)
                    .ignoresSafeArea()
                
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
                        
                        Text("Set Terms & Conditions")
                            .font(.customfont(.regular, fontSize: 20))
                            .foregroundColor(Color.secondaryTextColor)
                            .padding(.top, 10)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Terms")
                                .font(.customfont(.regular, fontSize: 14))
                                .foregroundColor(Color.secondaryTextColor)
                            TextField("Terms & Conditions", text: $txtTerms, axis: .vertical)
                                .disableAutocorrection(true)
                                .padding([.leading, .top], 7)
                                .frame(height: .screenHeight * 0.15, alignment: .topLeading)
                                .background(Color.lightGreyColor)
                                .cornerRadius(8)
                        }
                        .padding(.top, 20)
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Auto Reply")
                                .font(.customfont(.regular, fontSize: 14))
                                .foregroundColor(Color.secondaryTextColor)
                            TextField("Auto Reply", text: $txtAutoReply, axis: .vertical)
                                .disableAutocorrection(true)
                                .padding([.leading, .top], 7)
                                .frame(height: .screenHeight * 0.15, alignment: .topLeading)
                                .background(Color.lightGreyColor)
                                .cornerRadius(8)
                        }
                        .padding(.top, 20)
                        .padding(.horizontal)
                        
                        Text("Conditions")
                            .font(.customfont(.regular, fontSize: 20))
                            .foregroundColor(Color.secondaryTextColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .padding(.top, .topInsets + 10)
                            .padding(.bottom, .bottomInsets)
                        VStack(alignment: .leading) {
                            ForEach(kycSteps.indices, id: \.self) { item in
                                HStack {
                                    Image(kycSteps[item].imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16, height: 16)
                                    Text(kycSteps[item].text)
                                        .font(.customfont(.regular, fontSize: 14))
                                        .foregroundColor(Color.secondaryTextColor)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                    }
                }
                .clipped()
                
                HStack(spacing: 20) {
                    CustomBackButtonView(title: "Back", didTap: {
                        router.navigateBack()
                    }, minWidth: .screenWidth * 0.4, maxWidth: .screenWidth * 0.4)
                    .padding(.leading, 20)
                    CustomButtonView(title: "Publish Ad", didTap: {
                        (txtTerms.isEmpty) ? HUD.flash(.label("Please enter Terms & Conditions"), delay: 1) : (txtAutoReply.isEmpty) ? HUD.flash(.label("Please enter Auto Reply"), delay: 1) : isSelectedPublished.toggle()
                        
                    }, minWidth: .screenWidth * 0.4, maxWidth: .screenWidth * 0.4)
                    .padding(.trailing, 20)
                }
                .padding(.bottom, .bottomInsets + 20)
            }
        }
        .fullScreenCover(isPresented: $isSelectedPublished, content: {
            PublishedPoPupView(isSelectedPublished: $isSelectedPublished)
                .transition(.move(edge: .bottom))
                .background(AlmostTransparentDialogView())
        })
    }
}

#Preview {
    TermsAndConditionsView()
}

struct KYCStep: Identifiable {
    let id = UUID()
    let imageName: String
    let text: String
}

