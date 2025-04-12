//
//  CustomTextField.swift
//  P2PSpotTradingApp
//
//  Created by orange on 06/01/25.
//

import SwiftUI

struct CustomTextField: View {
    var title: String = ""
    var placeholder: String = ""
    @Binding var txt: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .foregroundColor(Color.heading_Black_TextColor)
                .font(.customfont(.regular, fontSize: 14))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            TextField(placeholder, text: $txt)
                .padding()
                .keyboardType(keyboardType)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(height: 45)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.lightGreyColor)
                )
        }
        .background(Color.white)
    }
}

// For secure Password
struct SecureCustomTextField: View {
    var title: String = ""
    var placeholder: String = ""
    @Binding var txt: String
    var keyboardType: UIKeyboardType = .default
    var isSecure: Bool = false
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .foregroundColor(Color.heading_Black_TextColor)
                .font(.customfont(.regular, fontSize: 14))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            ZStack(alignment: .trailing) {
                if isSecure && !isPasswordVisible {
                    SecureField(placeholder, text: $txt)
                        .padding(.trailing, 40)
                } else {
                    TextField(placeholder, text: $txt)
                        .padding(.trailing, 40)
                        .keyboardType(keyboardType)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                
                if isSecure {
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 8)
                }
            }
            .frame(height: 45)
            .padding(.horizontal, 10)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.lightGreyColor)
            )
        }
        .background(Color.white)
    }
}


#Preview {
    CustomTextField(txt: .constant("Enter app key"))
}
