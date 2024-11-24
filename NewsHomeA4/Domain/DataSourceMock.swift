//
//  DataSourceMock.swift
//  NewsHomeA3
//
//  Created by Ruan Patrick de Souza on 23/11/24.
//

import Foundation

let servicesMock: [ServiceType] = [
    ServiceType(id: 1, nome: "Exercitar", imagem: "exercitar"),
    ServiceType(id: 2, nome: "Meditar", imagem: "meditar"),
    ServiceType(id: 3, nome: "Alongamento", imagem: "alongar"),
    ServiceType(id: 4, nome: "Coffee time", imagem: "cafe"),
    ServiceType(id: 5, nome: "Pausa 5min", imagem: "pausa"),
    ServiceType(id: 6, nome: "Exercitar", imagem: "exercitar"),
]

let goalMock: [GoalType] = [
    GoalType(id: 1, icone: "moon.zzz.fill", titulo: "Descanso", descricao: "Dormir 8h por noite"),
    GoalType(id: 2, icone: "hare.fill", titulo: "Exercicio", descricao: "Correr 5km duas vezes na semana"),
    GoalType(id: 3, icone: "goforward.60", titulo: "Redes sociais", descricao: "Usar o celular por apenas 1h"),
    GoalType(id: 4, icone: "waterbottle.fill", titulo: "Água", descricao: "Tomar 2L de água por dia"),
    GoalType(id: 5, icone: "basket.fill", titulo: "Frutas", descricao: "Comer 2 frutas por dia"),
    GoalType(id: 6, icone: "book.fill", titulo: "Ler", descricao: "Ler as escrituras todas as noites"),
]
