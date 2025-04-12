//
//  LoginView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 07/01/25.
//

import SwiftUI
import PKHUD
import CryptoKit

struct LoginView: View {
    @State private var txtApi_key: String = ""//"qVztR5QYHiRsT9TAHmc25AtHnaOvoM5KLVGY9KNWPidyg77K70eKdUx56gXKcTMe"
    @State private var txtSecret_key: String = ""//"jXdQIZPOZry1ZPfM57n2bXC1JmiJ7ZK6YyTlOpCBkSyhO3wTht1xNXBaKVVmxnLH"
    @State private var isChecked = false
    @State private var isSelectToHome: Bool = false
    @State private var signature: String = ""
    @EnvironmentObject private var listOrderListing: ListUserOrderHistoryViewModel
    @State private var isSecurePassword: Bool = false
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
        UINavigationBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            Color(uiColor: UIColor.white)
                .edgesIgnoringSafeArea(.all)
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                .onAppear {
                    if let savedApiKey = userDefaultData.appKey.getDefaultValue() as? String,
                       let savedSecretKey = userDefaultData.secretKey.getDefaultValue() as? String {
                        txtApi_key = savedApiKey
                        txtSecret_key = savedSecretKey
                         ((txtApi_key.isEmpty) || (txtSecret_key.isEmpty)) ? (isChecked = false) : (isChecked = true)
                    }
                }
            /*.onAppear {
             if let savedApiKey = userDefaultData.appKey.getDefaultValue() as? String,
             let savedSecretKey = userDefaultData.secretKey.getDefaultValue() as? String,
             let decryptedApiKey = AESHelper.decrypt(savedApiKey),
             let decryptedSecretKey = AESHelper.decrypt(savedSecretKey) {
             txtApi_key = decryptedApiKey
             txtSecret_key = decryptedSecretKey
             isChecked = true
             }
             }*/
            
            VStack {
                Image("BinanceEase")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 212, height: 70)
                    .padding(.top, .topInsets + 40)
                
                Text("Connect Your Account")
                    .font(.customfont(.bold, fontSize: 28))
                    .foregroundStyle(Color.secondaryTextColor)
                    .padding(.top, .topInsets + 80)
                    .padding(.bottom, .bottomInsets + 30)
                
                VStack(spacing: 8) {
                    CustomTextField(title: "API Key", placeholder: "Enter Your Binance ID API key", txt: $txtApi_key)
                        .padding(.horizontal, 24)
                    
                    SecureCustomTextField(title: "Secret Key", placeholder: "Enter Your Binance ID secret key", txt: $txtSecret_key, isSecure: isSecurePassword)
                        .padding(.horizontal, 24)
                }
                HStack(alignment: .center, spacing: 4) {
                    CheckboxView(isChecked: $isChecked) {
                        isChecked.toggle()
                        saveLocalData()
                    }
                    Text("Remember my API and Secret Key on this device.")
                        .font(.customfont(.regular, fontSize: 12))
                        .foregroundStyle(Color.boarderColor)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                
                CustomButtonView(title: "Connect My Account", didTap: {
                    let errorMessage = (txtApi_key.isEmpty) ? "Please enter your binance ID API key" : (txtSecret_key.isEmpty) ? "Please enter your binance ID secret key" : nil
                    (errorMessage != nil) ? HUD.flash(.label(errorMessage!), delay: 1) : loadApiLogin()
                })
                .padding(.horizontal, 24)
                .padding(.top, .topInsets + 120)
                .padding(.bottom, 30)
            }
            .padding(.top, .topInsets + 20)
            .padding(.bottom, .bottomInsets + 60)
            .navigationDestination(isPresented: $isSelectToHome) {
                MainTabView()
            }
        }
    }
    
    //For store Data
    func saveLocalData() {
        if isChecked == true {
            userDefaultData.appKey.saveDefaultValue(txtApi_key)
            userDefaultData.secretKey.saveDefaultValue(txtSecret_key)
        } else {
            userDefaultData.appKey.deleteValue()
            userDefaultData.secretKey.deleteValue()
        }
    }
    /*func saveLocalData() {
     if isChecked {
     if let encryptedApiKey = AESHelper.encrypt(txtApi_key),
     let encryptedSecretKey = AESHelper.encrypt(txtSecret_key) {
     userDefaultData.appKey.saveDefaultValue(encryptedApiKey)
     userDefaultData.secretKey.saveDefaultValue(encryptedSecretKey)
     }
     } else {
     userDefaultData.appKey.deleteValue()
     userDefaultData.secretKey.deleteValue()
     }
     }*/
    
    
    func loadApiLogin() {
        register(target: AuthManagerProvider.loginApi(api_key: txtApi_key, secret_key: txtSecret_key)) { response, error in
            if error != nil {
                HUD.flash(.label(error?.localizedDescription), delay: 1)
            } else {
                if response != nil {
                    do {
                        let success = try JSONDecoder().decode(LoginModels.self, from: response!)
                        if success.status == 200 {
                            userDefaultData.token.saveDefaultValue(success.data?.token)
                            userDefaultData.login.saveDefaultValue("isLogin")
                            isSelectToHome.toggle()
                            print("Login token>>>>\(userDefaultData.token.getDefaultValue() as? String ?? "")")
                        }
                        
                    } catch let err {
                        HUD.flash(.label("\(err)"), delay: 1)
                        print("Catch Block>>>>\(err)")
                    }
                }
            }
        }
    }
    //For encription key
    /*func loadApiLogin() {
     register(target: AuthManagerProvider.loginApi(api_key: txtApi_key, secret_key: txtSecret_key)) { response, error in
     if error != nil {
     HUD.flash(.label(error?.localizedDescription), delay: 1)
     } else {
     if let responseData = response {
     do {
     let success = try JSONDecoder().decode(LoginModels.self, from: responseData)
     if success.status == 200 {
     if let token = success.data?.token, let encryptedToken = AESHelper.encrypt(token) {
     userDefaultData.token.saveDefaultValue(encryptedToken)
     }
     userDefaultData.login.saveDefaultValue("isLogin")
     isSelectToHome.toggle()
     print("Encrypted Login Token>>>>\(userDefaultData.token.getDefaultValue() as? String ?? "")")
     }
     } catch let err {
     HUD.flash(.label("\(err)"), delay: 1)
     print("Catch Block>>>>\(err)")
     }
     }
     }
     }
     }*/
    
    
}


#Preview {
    LoginView()
}

//Check box
struct CheckboxView: View {
    @Binding var isChecked: Bool
    var didTap: (()->())?
    var body: some View {
        Button(action: {
            didTap?()
        }) {
            Image(isChecked ? "Selected_CheckBox" : "UnselectedCheck")
                .resizable()
                .frame(width: 24, height: 24)
        }
        .foregroundColor(.blue)
    }
}
