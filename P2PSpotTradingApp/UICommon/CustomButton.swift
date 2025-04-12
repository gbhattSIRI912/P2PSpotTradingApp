//
//  CustomButton.swift
//  P2PSpotTradingApp
//
//  Created by orange on 06/01/25.
//

import SwiftUI

struct CustomButtonView: View {
    @State var title: String = "Title"
    var didTap: (()->())
    var forgroundColor: Color = Color.whiteTextColor
    var backgroundColor: Color = Color.primaryButtonColor
    var cornerRadius: CGFloat = 8
    var font: Font = .customfont(.bold, fontSize: 18)
    var minWidth: CGFloat = 0
    var maxWidth: CGFloat = .infinity
    
    var body: some View {
        Button {
            didTap()
        } label: {
            Text(title)
                .font(font)
                .foregroundColor(forgroundColor)
                .multilineTextAlignment(.center)
                .frame(minWidth: minWidth, maxWidth: maxWidth, minHeight: 45, maxHeight: 45 )
        }
        .frame(minWidth: minWidth, maxWidth: maxWidth, minHeight: 45, maxHeight: 45 )
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
    }
}


//Custom Back Button
struct CustomBackButtonView: View {
    @State var title: String
    var didTap: (()->())
    var forgroundColor: Color = Color.primaryButtonColor
    var boarderColor: Color = Color.primaryButtonColor
    var backgroundColor: Color = Color.whiteTextColor
    var cornerRadius: CGFloat = 8
    var font: Font = .customfont(.bold, fontSize: 18)
    var minWidth: CGFloat
    var maxWidth: CGFloat
    
    var body: some View {
        Button {
            didTap()
        } label: {
            Text(title)
                .font(font)
                .foregroundColor(forgroundColor)
                .multilineTextAlignment(.center)
                .frame(minWidth: minWidth, maxWidth: maxWidth, minHeight: 45, maxHeight: 45)
        }
        .frame(minWidth: minWidth, maxWidth: maxWidth, minHeight: 45, maxHeight: 45)
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.primaryButtonColor, lineWidth: 1)
        )
    }
}


struct CustomButtonWithImageView: View {
    @State var title: String = "Add"
    var didTap: (()->())?
    var forgroundColor: Color = Color.whiteTextColor
    var backgroundColor: Color = Color.primaryButtonColor
    var cornerRadius: CGFloat = 8
    var font: Font = .customfont(.bold, fontSize: 18)
    var minWidth: CGFloat = 0
    var maxWidth: CGFloat = .infinity
    
    var body: some View {
        HStack {
            Button {
                didTap?()
            } label: {
                HStack(spacing: 8) {
                    Image("add-circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .background(Color.white)
                        .clipShape(.circle)
                    Text(title)
                        .font(font)
                        .foregroundColor(forgroundColor)
                        .multilineTextAlignment(.center)
                }
                
            }
            .frame(minWidth: minWidth, maxHeight: 45)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
        }
      
    }
}

struct CustomFloatingPriceView: View {
    var minWidth: CGFloat = 0
    var maxWidth: CGFloat = .infinity
    @Binding var title: Double
    var didTapAdd: () -> ()
    var didTapMinus: () -> ()
    @Binding var selectedType: String
    @State private var txtSelectedValue: String = "0"

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text((selectedType == "Fixed") ? "Fixed Price" : "Floating Price Margin")
                .font(.customfont(.regular, fontSize: 14))
                .foregroundStyle(Color.secondaryTextColor)

            if selectedType == "Fixed" {
                HStack {
                    Button {
                        didTapMinus()
                    } label: {
                        Image("minus-cirlce")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .trailing)
                            .padding(.leading, 10)
                    }

                    Spacer()
                    
                    TextField("", text: $txtSelectedValue)
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundStyle(Color.secondaryTextColor)
                        .padding([.leading, .trailing], 2)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .onChange(of: txtSelectedValue) { newValue in
                            if let newPrice = Double(newValue) {
                                title = newPrice
                            }
                        }

                    Spacer()

                    Button {
                        didTapAdd()
                    } label: {
                        Image("add-circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .leading)
                            .padding(.trailing, 10)
                    }
                }
                .frame(minWidth: minWidth, maxWidth: maxWidth, minHeight: 45, maxHeight: 45)
                .background(Color.lightGreyColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.boarderColor, lineWidth: 0.5)
                )
            } else {
                HStack {
                    Button {
                        didTapMinus()
                    } label: {
                        Image("minus-cirlce")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .trailing)
                            .padding(.leading, 10)
                    }

                    Spacer()
                    
                    Text(String(format: "%.2f %%", title))
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundStyle(Color.black)

                    Spacer()

                    Button {
                        didTapAdd()
                    } label: {
                        Image("add-circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .leading)
                            .padding(.trailing, 10)
                    }
                }
                .frame(minWidth: minWidth, maxWidth: maxWidth, minHeight: 45, maxHeight: 45)
                .background(Color.lightGreyColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.boarderColor, lineWidth: 0.5)
                )
            }

            Text((selectedType == "Fixed") ? "Fixed Price will be % of market price" : "Floating Price will be % of market price")
                .font(.customfont(.regular, fontSize: 11))
                .foregroundStyle(Color.secondaryTextColor)
        }
    }
}




struct CustomSegmentedControl: View {
    @Binding var selectedSegment: String
    var segments: [String]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.teal, lineWidth: 1.5)
                .frame(height: 44)

            // Background for the selected segment
            HStack(spacing: 0) {
                ForEach(segments, id: \.self) { segment in
                    RoundedRectangle(cornerRadius: 14)
                        .fill(selectedSegment == segment ? Color.teal.opacity(0.3) : Color.clear)
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(height: 44)

            // Buttons
            HStack(spacing: 0) {
                ForEach(segments, id: \.self) { segment in
                    Button(action: {
                        withAnimation {
                            selectedSegment = segment
                        }
                    }) {
                        Text(segment)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(selectedSegment == segment ? .black : .gray)
                            .fontWeight(.medium)
                    }
                }
            }
        }
        .padding(4)
        .frame(height: 44)
    }
}



#Preview {
    CustomSegmentedControl(selectedSegment: .constant("Buy"), segments: [""])
}

//MARK: - Transparent view
struct AlmostTransparentDialogView: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let view = UIView()
    DispatchQueue.main.async {
      let almostTransparent = UIColor(red: 1, green: 1, blue: 1, alpha: 0.30)
      view.superview?.superview?.backgroundColor = almostTransparent
    }
    return view
  }

 func updateUIView(_ uiView: UIView, context: Context) {}
}



//For safe Area top Padding
struct SafeAreaTopPadding: ViewModifier {
    func body(content: Content) -> some View {
        // Get the window scene and safe area inset
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let topInset = windowScene.windows.first?.safeAreaInsets.top ?? 0
            return content
                .padding(.top, topInset)
        }
        return content.padding(.top, 0)
    }
}

extension View {
    func safeAreaTopPadding() -> some View {
        self.modifier(SafeAreaTopPadding())
    }
}

