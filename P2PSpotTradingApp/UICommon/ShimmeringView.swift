//
//  ShimmeringView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 31/01/25.
//

import SwiftUI

struct ShimmeringView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Stock List Placeholder
            VStack(spacing: 10) {
                ForEach(0..<8) { _ in
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 80)
                        .shimmering()
                }
            }
            .frame(maxHeight: .infinity)
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    ShimmeringView()
}
