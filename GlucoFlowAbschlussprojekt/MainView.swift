//
//  MainView.swift
//  GlucoFlowAbschlussprojekt
//
//  Created by Dennis Bischof on 02.08.24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack{
            TabView{
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                CalendarView()
                    .tabItem {
                        Label("Kalender", systemImage: "calendar")
                    }
            }
            
        }
    }
}

#Preview {
    MainView()
}
