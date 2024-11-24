//
//  CarouselTabView.swift
//  NewsHomeA3
//
//  Created by Ruan Patrick de Souza on 24/11/24.
//

import SwiftUI

struct CarouselTabView: View {
    let bannerList: [ServiceType] = [
            ServiceType(id: 1, nome: "", imagem: "motivacional1"),
            ServiceType(id: 2, nome: "", imagem: "motivacional2"),
            ServiceType(id: 3, nome: "", imagem: "motivacional3"),]
    var body: some View {
        TabView{
            ForEach(bannerList){ banner in CarouselItemView(banner: banner)}
        }.frame(height: 300).tabViewStyle(.page(indexDisplayMode: .never))
    }
}

#Preview {
    CarouselTabView()
}
