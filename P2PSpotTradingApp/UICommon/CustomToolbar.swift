//
//  CustomToolbar.swift
//  P2PSpotTradingApp
//
//  Created by orange on 08/01/25.
//

import SwiftUI

struct CustomToolbar: View {
    var title: String
    var leftButtonImage: String
    var rightButtonImages: [String]?
    var centerText: String?
    var onLeftButtonTapped: () -> Void
    var onRightButtonTapped: () -> Void
    var isRightToolbar: Bool = false
    
    var body: some View {
        HStack {
        HStack {
            // Left Button
            if (!(title.isEmpty)  ) {
                Button(action: onLeftButtonTapped, label: {
                    HStack(spacing: 0) {
                        if !(leftButtonImage == "") {
                            Image(leftButtonImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32, alignment: .leading)
                        }
                        
                        
                        Text(title)
                            .foregroundStyle(Color.heading_Black_TextColor)
                            .font(.customfont(.bold, fontSize: 24))
                            .padding([.leading, .bottom], 10)
                    }
                })
                .padding(.leading, 10)
            }
            
            
            Spacer()
            
            // Center Text (only shown if centerText is provided)
            if let centerText = centerText {
                Text(centerText)
                    .font(.customfont(.bold, fontSize: 18))
                    .foregroundColor(Color.primary)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
            }
            if isRightToolbar == true {
                // Right Button
                Button(action: onRightButtonTapped, label: {
                    HStack(spacing: 0) {
                        ForEach(rightButtonImages ?? [], id: \.self) { image in
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                    }
                    .frame(width: 40)
                })
            }
            
        }
        .padding(.top, .topInsets + 20)
        .padding(.horizontal)
        .frame(height: 60, alignment: .center)
        .background(Color.whiteTextColor)
        .padding(.bottom, 10)
    }
    }
}

#Preview {
    CustomToolbar(title: "P2P", leftButtonImage: "arrow_left", rightButtonImages: [""], onLeftButtonTapped: {
        print("onLeftButtonTapped")
    }, onRightButtonTapped: {
        print("onRightButtonTapped")
    })
}
