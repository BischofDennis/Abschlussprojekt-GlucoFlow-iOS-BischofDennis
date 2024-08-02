//
//  HomeView.swift
//  GlucoFlowAbschlussprojekt
//
//  Created by Dennis Bischof on 02.08.24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            VStack{
                
                Text("Home")
            }
            .background(
            Image("hintergrund")
                .scaledToFill()
            )
        }
    }
}

#Preview {
    HomeView()
}
