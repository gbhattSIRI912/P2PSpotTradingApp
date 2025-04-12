//
//  Router.swift
//  P2PSpotTradingApp
//
//  Created by orange on 06/01/25.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    // Contains the possible destinations in our Router
    enum Route: Hashable {
        case postAdsStepFirstView
        case postAdsStepTwoView
        case priceChangeStepThreeView
        case termsAndConditionsView
        case searchTextView
        case detailPricePageView
        case bNBInfoView
        case mainTabView
        case loginView
    }
    
    // Used to programatically control our navigation stack
    @Published var path: NavigationPath = NavigationPath()
    
    // Builds the views
    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .postAdsStepFirstView:
            PostAdsStepFirstView()
        case .postAdsStepTwoView:
            PostAdsStepTwoView()
        case .priceChangeStepThreeView:
            PriceChangeStepThreeView()
        case .termsAndConditionsView:
            TermsAndConditionsView()
        case .searchTextView:
            SearchView()
        case .detailPricePageView:
            DetailPriceView()
        case .bNBInfoView:
            BNBInfoView()
        case .mainTabView:
            MainTabView()
        case .loginView:
            LoginView()
        }
    }
    
    // Used by views to navigate to another view
    func navigateTo(_ appRoute: Route) {
        path.append(appRoute)
    }
    
    // Used to go back to the previous screen
    func navigateBack() {
        path.removeLast()
    }
    
    // Pop to the root screen in our hierarchy
    func popToRoot() {
        path.removeLast(path.count)
    }
}

// View containing the necessary SwiftUI
// code to utilize a NavigationStack for
// navigation accross our views.
struct RouterView<Content: View>: View {
    @StateObject var router: Router = Router()
    // Our root view content
    private let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: Router.Route.self) { route in
                        router.view(for: route)
                }
        }
        .environmentObject(router)
        
    }
}




