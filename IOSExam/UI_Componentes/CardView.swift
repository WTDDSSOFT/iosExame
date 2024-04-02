//
//  CardView.swift
//  IOSExam
//
//  Created by willaim santos on 16/03/24.
//

import SwiftUI

struct CardView: View {
    
    @State var fields: Photo?

    var body: some View {
        ZStack {
            CardImageFactory(imageUrlfield: fields?.url)
        }
    }
}
#Preview {
    ContentView()
}
