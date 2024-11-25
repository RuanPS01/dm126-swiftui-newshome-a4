//
//  CarouselTabView.swift
//  NewsHomeA3
//
//  Created by Ruan Patrick de Souza on 24/11/24.
//

import SwiftUI

struct CarouselTabView: View {
    @StateObject private var viewModel = CarouselViewModel()
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .frame(height: 300)
            } else if let error = viewModel.error {
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .frame(height: 300)
            } else {
                TabView {
                    ForEach(viewModel.news) { news in
                        CarouselItemView(news: news)
                    }
                }
                .frame(height: 200)
                .tabViewStyle(.page(indexDisplayMode: .automatic))
            }
        }
        .onAppear {
            if viewModel.news.isEmpty {
                viewModel.fetchNews()
            }
        }
    }
}

// Dados para visualização do Preview
class PreviewCarouselViewModel: CarouselViewModel {
    override func fetchNews() {
        self.news = [
            CarouselNewsType(
                title: "Apple lança novo MacBook Pro",
                imageUrl: "https://example.com/image1.jpg"
            ),
            CarouselNewsType(
                title: "Tesla apresenta novo modelo de carro elétrico",
                imageUrl: "https://example.com/image2.jpg"
            ),
            CarouselNewsType(
                title: "Google anuncia novidades no Android",
                imageUrl: "https://example.com/image3.jpg"
            )
        ]
    }
}

struct CarouselTabView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselTabView()
            .environmentObject(PreviewCarouselViewModel())
    }
}

#Preview("Carousel de Notícias") {
    CarouselTabView()
        .environmentObject(PreviewCarouselViewModel())
}
