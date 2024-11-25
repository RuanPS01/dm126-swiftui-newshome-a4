//
//  GoalListView.swift
//  NewsHomeA3
//
//  Created by Ruan Patrick de Souza on 24/11/24.
//

import SwiftUI

struct SmallNewsListView: View {
    let news: SmallNewsType
    
    var body: some View {
        HStack {
            Image(systemName: news.image)
                .font(.largeTitle)
                .frame(width: 50)
            
            VStack(alignment: .leading) {
                Text(news.title)
                    .font(.headline)
                    .lineLimit(2)
                
                Text(news.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
        }
        .foregroundStyle(.blue)
        .padding(.horizontal)
    }
}

#Preview("Notícia Simples") {
    SmallNewsListView(news: SmallNewsType(
        title: "Título da notícia",
        description: "Descrição da notícia"
    ))
    .padding()
}
