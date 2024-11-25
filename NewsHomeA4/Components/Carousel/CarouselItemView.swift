//
//  CarouselItemView.swift
//  NewsHomeA3
//
//  Created by Ruan Patrick de Souza on 24/11/24.
//

import SwiftUI

struct CarouselItemView: View {
    let news: CarouselNewsType
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: news.imageUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }
            .cornerRadius(16)
            VStack {
                Text(news.title)
                    .font(.headline)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
            }
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color.black.opacity(0),
                            Color.black.opacity(0.7)
                        ]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
        }
        .shadow(radius: 5).frame(width: 300)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

// Dados para visualização do Preview
struct CarouselItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Preview com título curto
            CarouselItemView(news: CarouselNewsType(
                title: "Apple lança novo iPhone 15",
                imageUrl: "https://exemplo.com/imagem1.jpg"
            ))
            
            // Preview com título longo
            CarouselItemView(news: CarouselNewsType(
                title: "Tesla anuncia novo recorde de produção e supera expectativas do mercado no terceiro trimestre",
                imageUrl: "https://exemplo.com/imagem2.jpg"
            ))
        }
        .previewLayout(.sizeThatFits)
        .frame(width: 350, height: 200)
        .padding()
    }
}

#Preview("Carousel Item") {
    CarouselItemView(news: CarouselNewsType(
        title: "Apple lança novo iPhone 15",
        imageUrl: "https://exemplo.com/imagem1.jpg"
    ))
    .frame(width: 350, height: 200)
    .padding()
}
