//
//  ButtonView.swift
//  SwiftUILibrary
//
//  Created by Mayur Nilwant on 10/01/2024.
//

import SwiftUI



enum ButtonTypeForApp   {
    
    case buttonWithTextAndBorder(String,CGFloat)
    case buttonWIthImageAndTitle(String, String, CGFloat)
    case circularButtonWithImage(String)
    
}

struct MNButtonView: View {
    
    private var buttonType: ButtonTypeForApp
    
    
    init(withButtonType bType: ButtonTypeForApp) {
        self.buttonType = bType
        
    }
    var body: some View {
        
        switch self.buttonType {
        case .buttonWithTextAndBorder(let title,_):
            do {
                
                Button  {
                    
                } label: {
                    Text(title)
                        .padding()
                }
                .background{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.blue, lineWidth: 2)
                }
            }
        case .buttonWIthImageAndTitle(let title,let imageName, _ ):
            do {
                
                Button {
                } label: {
                    HStack {
                        Image(systemName: imageName)
                        Text(title)
                    }
                }
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.blue, lineWidth: CGFloat(2))
                }
            }
        case .circularButtonWithImage(let _imgName):
            do {
                Button {
                    
                } label: {
                    Image(systemName: _imgName)
                        .clipShape(Circle())
                }
            }
        }
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack(spacing: 30) {
            MNButtonView(withButtonType: ButtonTypeForApp.buttonWithTextAndBorder("Take a photo", 1))
            MNButtonView(withButtonType: ButtonTypeForApp.buttonWIthImageAndTitle("take a photo", "camera.circle.fill", 2))
            MNButtonView(withButtonType: ButtonTypeForApp.circularButtonWithImage("plus.circle"))
                
            Spacer()
        }
        
        
    }
}


