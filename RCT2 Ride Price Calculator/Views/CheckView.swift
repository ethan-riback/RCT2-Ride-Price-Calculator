//
//  CheckView.swift
//  RCT2 Ride Price Calculator
//
//  Created by Ethan Riback on 7/16/20.
//  Copyright © 2020 Ethan Riback. All rights reserved.
//

import SwiftUI

struct CheckView: View {
    @Binding var isChecked: Bool
    var title:String
    private var image: String { isChecked ? "checkmark.square.fill": "square" }
    private var imageColor: Color { isChecked ? .blue : .gray }

    func toggle() { isChecked.toggle() }

    var body: some View {
        Button(action: toggle) {
            HStack {
                Text(title).foregroundColor(.black)
                Image(systemName: image)
                    .foregroundColor(imageColor)
            }
        }
    }
}

