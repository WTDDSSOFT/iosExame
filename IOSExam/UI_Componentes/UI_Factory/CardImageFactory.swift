//
//  CardImage.swift
//  IOSExam
//
//  Created by willaim santos on 16/03/24.
//

import SwiftUI

struct CardImageFactory: View {
    @State var imageUrlfield: String?

    var body: some View {
        if let imageURL = imageUrlfield {
            AsyncImage(url: URL(string: imageURL), scale: 2) { phase in
                switch phase {
                case .failure:
                    Image(systemName: "photo") .font(.largeTitle)
                case .success(let image):
                    image .resizable()
                default:
                    ProgressView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding()
        }
    }
}

#Preview {
    CardImageFactory()
}
