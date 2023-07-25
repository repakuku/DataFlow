//
//  ButtonView.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/24/23.
//

import SwiftUI

struct ButtonView: View {
    let action: () -> Void
    let title: String
    let color: Color
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Text(title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 60)
            .background(color)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.black, lineWidth: 4)
            )
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(action: {}, title: "Start", color: .red)
    }
}
