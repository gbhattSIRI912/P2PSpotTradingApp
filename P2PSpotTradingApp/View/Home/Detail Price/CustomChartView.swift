//
//  CustomChartView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 14/01/25.
//

import SwiftUI
import Charts

struct CustomChartView: View {
    @StateObject private var vm = ChartViewModel()
    @State private var selectedTime: String = "Time"
    let timeOptions = ["Time", "15m", "1h", "4h", "8h", "12h", "1D", "2D"]
    
    var body: some View {
        VStack {
            HStack {
                HStack(spacing: 18) {
                    // Time Options
                    ForEach(timeOptions, id: \.self) { time in
                        VStack(spacing: 0) {
                            Text(time)
                                .font(time == selectedTime ? .customfont(.regular, fontSize: 12) : .customfont(.regular, fontSize: 12))
                                .foregroundColor(time == selectedTime ? Color.primaryButtonColor : Color.greyColor)
                            Divider()
                                .frame(maxWidth: selectedTime == time ? nil : 0, minHeight: 1 ,maxHeight: 1)
                                .background(selectedTime == time ? Color.primaryButtonColor : Color.clear)
                            
                        }
                        .onTapGesture {
                            selectedTime = time
                        }
                    }
                }
                Spacer()
                
                // Filter Button
                Button(action: {
                    print("Filter button tapped")
                }) {
                    ZStack(alignment: .top) {
                        HStack(spacing: 5) {
                            Text("Filter")
                                .font(.customfont(.regular, fontSize: 12))
                                .foregroundStyle(Color.primaryButtonColor)
                            
                            Image(systemName: "slider.horizontal.3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                                .tint(Color.primaryButtonColor)
                        }
                    }
                    
                    
                    
                }
            }
            .fixedSize(horizontal: true, vertical: false)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            //Char graph
            chart
                .chartXAxis { chartXAxis }
                .chartXScale(domain: 0...(Double(StaticChartData.items.count - 1)))
                .chartYAxis { chartYAxis }
                .chartYScale(domain: 0...(StaticChartData.items.max() ?? 100))
                .chartPlotStyle { chartPlotStyle($0) }
                .chartOverlay { proxy in
                    GeometryReader { gProxy in
                        Rectangle().fill(.clear).contentShape(Rectangle())
                            .gesture(DragGesture(minimumDistance: 0)
                                .onChanged { onChangeDrag(value: $0, chartProxy: proxy, geometryProxy: gProxy) }
                                .onEnded { _ in
                                    vm.selectedX = nil
                                    
                                }
                            )
                    }
                }
        }
    }
    
    private var chart: some View {
        Chart {
            ForEach(Array(zip(StaticChartData.items.indices, StaticChartData.items)), id: \.0) { index, item in
                LineMark(
                    x: .value("Time", index),
                    y: .value("Price", item)
                )
                .foregroundStyle(vm.foregroundMarkColor)
                
                AreaMark(
                    x: .value("Time", index),
                    yStart: .value("Min", 0),
                    yEnd: .value("Max", item)
                )
                .foregroundStyle(LinearGradient(
                    gradient: Gradient(colors: [
                        vm.foregroundMarkColor,
                        .clear
                    ]), startPoint: .top, endPoint: .bottom)
                ).opacity(0.3)
                
                if let previousClose = StaticChartData.previousCloseRuleMarkValue {
                    RuleMark(y: .value("Previous Close", previousClose))
                        .lineStyle(.init(lineWidth: 0.2, dash: [2]))
                        .foregroundStyle(.pink.opacity(0.3))
                }
                
                if let (selectedX, text) = vm.selectedXRuleMark {
                    RuleMark(x: .value("Selected timestamp", selectedX))
                        .lineStyle(.init(lineWidth: 1))
                        .annotation {
                            Text(text)
                                .font(.customfont(.regular, fontSize: 9.5))
                                .foregroundColor(Color.primaryButtonColor)
                        }
                        .foregroundStyle(vm.foregroundMarkColor)
                }
            }
        }
    }
    
    //Chart X Axis
    private var chartXAxis: some AxisContent {
        AxisMarks(values: Array(stride(from: 0, through: StaticChartData.items.count - 1, by: max(1, StaticChartData.items.count / 10)))) { value in
            if let index = value.as(Int.self) {
                AxisGridLine(stroke: .init(lineWidth: 0.3))
                AxisTick(stroke: .init(lineWidth: 0.3))
                AxisValueLabel {
                    Text("X\(index)")
                        .foregroundColor(Color(uiColor: .label))
                        .font(.customfont(.regular, fontSize: 12))
                }
            }
        }
    }
    
    //Chart Y Axis
    private var chartYAxis: some AxisContent {
        AxisMarks(preset: .automatic, values: .stride(by: 30)) { value in
            if let y = value.as(Double.self) {
                AxisGridLine(stroke: .init(lineWidth: 0.3))
                AxisTick(stroke: .init(lineWidth: 0.3))
                AxisValueLabel {
                    Text("\(Int(y))")
                        .foregroundColor(Color(uiColor: .label))
                        .font(.customfont(.regular, fontSize: 12))
                }
            }
        }
    }
    
    //Plot style for X Axis
    private func chartPlotStyle(_ plotContent: ChartPlotContent) -> some View {
        plotContent
            .frame(height: 200)
            .overlay {
                Rectangle()
                    .foregroundColor(.red.opacity(0.5))
                    .mask(ZStack {
                        VStack {
                            Spacer()
                            Rectangle().frame(height: 1)
                        }
                        
                        HStack {
                            Spacer()
                            Rectangle().frame(width: 0.3)
                        }
                    })
            }
    }
    
    //On Drag
    private func onChangeDrag(value: DragGesture.Value, chartProxy: ChartProxy, geometryProxy: GeometryProxy) {
        let xCurrent = value.location.x - geometryProxy[chartProxy.plotAreaFrame].origin.x
        if let index: Double = chartProxy.value(atX: xCurrent),
           index >= 0,
           Int(index) <= StaticChartData.items.count - 1 {
            self.vm.selectedX = Int(index)
        }
    }
}
#Preview {
    CustomChartView()
}

struct StaticChartData {
    static let items = [10, 20, 40, 60, 80, 100, 120, 140, 160, 180, 200, 220]
    static let previousCloseRuleMarkValue: Double? = 50
}

