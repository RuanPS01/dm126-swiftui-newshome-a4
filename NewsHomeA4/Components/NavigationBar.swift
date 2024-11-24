//
//  NavigationBar.swift
//  NewsHomeA3
//
//  Created by Ruan Patrick de Souza on 23/11/24.
//

import SwiftUI

struct NavigationBar: View {
    @State private var userName: String = "Ruan Patrick"
    @State private var showingNameSheet: Bool = false
    @State private var tempName: String = ""
    
    var body: some View {
        HStack {
            Button(userName) {}
                .font(.headline)
                .fontWeight(.bold)
            
            Button(action: {
                tempName = userName
                showingNameSheet = true
            }){
                Image(systemName: "square.and.pencil.circle.fill")
                    .font(.title3)
                    .foregroundStyle(.gray)
            }
            .sheet(isPresented: $showingNameSheet) {
                NavigationView {
                    VStack(spacing: 20) {
                        Text("Alterar Nome")
                            .font(.headline)
                        
                        TextField("Digite o novo nome", text: $tempName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .onSubmit {
                                if !tempName.isEmpty {
                                    userName = tempName
                                    showingNameSheet = false
                                }
                            }
                        
                        HStack {
                            Button("Cancelar") {
                                showingNameSheet = false
                            }
                            .foregroundColor(.red)
                            
                            Spacer()
                            
                            Button("Confirmar") {
                                if !tempName.isEmpty {
                                    userName = tempName
                                    showingNameSheet = false
                                }
                            }
                            .foregroundColor(.blue)
                        }
                        .padding()
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    NavigationBar()
}
