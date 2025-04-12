//
//  AdsBuyView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 07/01/25.
//

import SwiftUI

struct AdsBuyView: View {
    @EnvironmentObject var router: Router
    @State private var selectedSegment: String = "Sell"
    @State private var arrAdvertsList: [String] = [""]
    @State private var isSwitchOn = false
    
    @State private var isSelectAds: Bool = false
    @State private var adsTitle: String = "All Ads"
    @State private var toggleStates = Array(repeating: false, count: 7)
    var body: some View {
        ZStack {
            Color.whiteTextColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                // Top Bar
                CustomToolbar(title: "My Adverts", leftButtonImage: "",  onLeftButtonTapped: {},
                              onRightButtonTapped: {
                    print("Right Action")
                }, isRightToolbar: false)
                
                VStack {
                    CustomSegmentedControl(selectedSegment: $selectedSegment, segments: ["Buy", "Sell"])
                        .padding(.horizontal)
                        .padding(.top, 10)
                    ScrollView {
                        VStack {
                            HStack {
                                Text("List of Ads")
                                    .font(.customfont(.bold, fontSize: 20))
                                    .foregroundStyle(Color.heading_Black_TextColor)
                                Spacer()
                                Button(action: {
                                    router.navigateTo(.postAdsStepFirstView)
                                }, label: {
                                    HStack(spacing: 0) {
                                        Image("add-circle")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 16, height: 16)
                                        Text("Create New Ads")
                                            .font(.customfont(.regular, fontSize: 14))
                                            .foregroundStyle(Color.lightGreenColor)
                                    }
                                })
                            }
                            .padding(.horizontal)
                            .padding(.top, 8)

                            ForEach(0..<7, id: \.self) { index in
                                ListOfAdsView(isSwitchOn: $toggleStates[index],
                                    isSelectMoreAction: $isSelectAds, editAction: {
                                    router.navigateTo(.postAdsStepFirstView)
                                }, deleteAction: {
                                    
                                })
                            }
                        }
                        
                    }
                    .padding(.bottom, .bottomInsets + 80)
                }
            }
        }
        .fullScreenCover(isPresented: $isSelectAds, content: {
            MoreActionView(isHidePopUpView: $isSelectAds, viewAds: $adsTitle)
                .background(AlmostTransparentDialogView())
                .transition(.move(edge: .bottom))
                .ignoresSafeArea()
            
        })
    }
}

#Preview {
    AdsBuyView()
}
