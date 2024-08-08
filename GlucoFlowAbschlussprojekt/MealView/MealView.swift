//
//  MealView.swift
//  GlucoFlowAbschlussprojekt
//
//  Created by Dennis Bischof on 02.08.24.
//

import SwiftUI

struct MealView: View {
    
        @StateObject private var viewModel = MealViewModel()
        
        var body: some View {
            NavigationStack {
                List(viewModel.rezeptListe, id: \.id) { receipt in
                    NavigationLink{
                        
                    } label: {
                        AsyncImage(url: receipt.image) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(6)
                                .frame(width: 100,height: 80)
                        } placeholder: {
                            Image("load")
                                .font(.largeTitle)
                        }
                        VStack(alignment: .leading){
                            
                            Text(receipt.title)
                                .font(.headline)
                            
                        }
                    }
                }
            }
            .onAppear{
                viewModel.fetchData()
            }
        }
    }
#Preview {
    MealView()
}
