//
//  ProgressBarView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 08/01/25.
//

import SwiftUI

struct ProgressBarView: View {
    let greenPercentage: CGFloat
    let redPercentage: CGFloat

    var body: some View {
        HStack(spacing: 10) {
            Text(String(format: "%.2f%%", greenPercentage))
                .font(.customfont(.regular, fontSize: 10))
                .foregroundStyle(Color.greenColor)

            // Progress bar
            ZStack(alignment: .leading) {
                GeometryReader { geometry in
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.3))

                        HStack(spacing: 0) {
                            Rectangle()
                                .fill(Color.greenColor)
                                .frame(width: geometry.size.width * greenPercentage / 100)
                            Rectangle()
                                .fill(Color.textRedColor)
                                .frame(width: geometry.size.width * redPercentage / 100)
                        }
                    }
                }
            }
            .frame(height: 8)
            .frame(maxWidth: .infinity)
            .cornerRadius(4)

            Text(String(format: "%.2f%%", redPercentage))
                .font(.customfont(.regular, fontSize: 10))
                .foregroundStyle(Color.textRedColor)
        }
    }
}

#Preview {
    ProgressBarView(greenPercentage: 92.20, redPercentage: 7.80)
        .frame(height: 30)
}
