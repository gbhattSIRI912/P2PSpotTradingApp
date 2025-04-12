//
//  PublishedPoPupView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 10/01/25.
//

import SwiftUI

struct PublishedPoPupView: View {
    @Binding var isSelectedPublished: Bool
    @EnvironmentObject var router: Router
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black
                .opacity(0.5)
            VStack {
                Image("Success")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120, alignment: .top)
                
                Text("Your ad has been published")
                    .font(.customfont(.regular, fontSize: 20))
                    .foregroundStyle(Color.secondaryTextColor)
                
                CustomButtonView(title: "View Advertise", didTap: {
                    isSelectedPublished = false
                    router.navigateTo(.mainTabView)
                }, cornerRadius: 18, maxWidth: .infinity)
                .padding(.top, .topInsets + 40)
                .padding(.horizontal, 20)
                .padding(.bottom, .bottomInsets)
            }
            .padding(.horizontal)
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
    PublishedPoPupView(isSelectedPublished: .constant(false))
}
