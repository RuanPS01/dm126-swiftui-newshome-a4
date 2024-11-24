//
//  CarouselItemView.swift
//  NewsHomeA3
//
//  Created by Ruan Patrick de Souza on 24/11/24.
//

import SwiftUI

struct CarouselItemView: View {
    let banner: ServiceType
    var body: some View {
        Image(banner.imagem).resizable().scaledToFit().cornerRadius(16)
    }
}
#Preview {
    CarouselItemView(banner: ServiceType(id: 1, nome: "", imagem:"motivacional1"))
}
