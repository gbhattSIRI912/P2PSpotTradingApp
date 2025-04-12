//
//  CircleLoader.swift
//  P2PSpotTradingApp
//
//  Created by orange on 24/02/25.
//

import SwiftUI

struct CircleLoader: View {
    @State private var angle:Double = 0.0
    var body: some View {
        Circle()
            .trim(from: 0.1,to: 1.0)
            .stroke(style: StrokeStyle(lineWidth: 3,lineCap: .round,lineJoin: .round))
            .foregroundStyle(Color.green)
            .rotationEffect(Angle(degrees: angle))
            .frame(width: 50, height: 50, alignment: .center)
            .onAppear{
                withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                    angle = 360
                }
            }
    }
}

#Preview {
    CircleLoader()
}
