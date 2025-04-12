//
//  ChartViewModel.swift
//  P2PSpotTradingApp
//
//  Created by orange on 14/01/25.
//

import Foundation
import SwiftUI

class ChartViewModel: ObservableObject {
    @Published var selectedX: Int?
    @Published var foregroundMarkColor: Color = .green
    
    var selectedXRuleMark: (Double, String)? {
        guard let selectedX = selectedX else { return nil }
        let value = StaticChartData.items[selectedX]
        return (Double(selectedX), "Value: \(value)")
    }
}
