//
//  GoalContainer.swift
//  NewsHomeA3
//
//  Created by Ruan Patrick de Souza on 24/11/24.
//

import SwiftUI

struct SmallNewsContainer: View {
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if viewModel.isLoading {
                ProgressView("Loading news...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = viewModel.error {
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .padding()
            } else {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(viewModel.news) { news in
                            SmallNewsListView(news: news)
                        }
                    }
                    .padding(.vertical)
                }
            }
        }
        .onAppear {
            viewModel.fetchNews()
        }
    }
}

class PreviewNewsViewModel: NewsViewModel {
    override func fetchNews() {
        self.news = [
            SmallNewsType(
                title: "Apple anuncia novo iPhone 15",
                description: "Novo smartphone traz câmera de 48MP"
            ),
            SmallNewsType(
                title: "Tesla bate recorde de vendas",
                description: "Empresa supera expectativas no trimestre"
            ),
            SmallNewsType(
                title: "Microsoft anuncia novidades no Windows",
                description: "Atualização traz recursos de IA"
            )
        ]
    }
}

// Extension com exemplos para preview
extension SmallNewsType {
    static let examples = [
        SmallNewsType(
            title: "Apple anuncia novo iPhone 15 com recursos revolucionários",
            description: "O novo smartphone da Apple traz câmera de 48MP e processador A17 Bionic"
        ),
        SmallNewsType(
            title: "Tesla atinge nova marca de produção de carros elétricos",
            description: "Empresa de Elon Musk supera expectativas no terceiro trimestre"
        ),
        SmallNewsType(
            title: "Título muito longo que deve quebrar em duas linhas para testar o limite",
            description: "Esta é uma descrição muito longa que também deve quebrar em duas linhas"
        )
    ]
}

#Preview("Container de Notícias") {
    SmallNewsContainer()
        .environmentObject(PreviewNewsViewModel())
}
