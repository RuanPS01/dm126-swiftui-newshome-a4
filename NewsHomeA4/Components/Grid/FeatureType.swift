//
//  FeatureType.swift
//  NewsHomeA3
//
//  Created by Ruan Patrick de Souza on 24/11/24.
//

import SwiftUI

struct FeatureType: View {
    let service: CategoryNewsType
    @State private var isFullScreen = false
    
    var body: some View {
        VStack {
            Image(service.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(8)
                .fixedSize(horizontal: false, vertical: false)
                .onTapGesture {
                    isFullScreen = true
                }
                .fullScreenCover(isPresented: $isFullScreen) {
                    FullScreenImageView(image: Image(service.image), isPresented: $isFullScreen)
                }
            
            Text(service.name)
                .font(.system(size: 14))
        }
        .frame(width: 100, height: 100)
    }
}

struct FullScreenImageView: View {
    let image: Image
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            image
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    FeatureType(service: CategoryNewsType(id: 1, name: "Exercitar", image: "coffee"))
}
