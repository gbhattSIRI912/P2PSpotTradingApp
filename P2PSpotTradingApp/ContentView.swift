//
//  ContentView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 06/01/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: Router
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! gfdgfdfg")
                .onTapGesture {
                    //router.navigateTo(.viewB)
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct ViewB: View {
    @EnvironmentObject var router: Router
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello,")
        }
}
}
