//
//  MainView.swift
//  GlucoFlowAbschlussprojekt
//
//  Created by Dennis Bischof on 02.08.24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack{
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink {
                        CalendarView()
                    } label: {
                        Image(systemName: "calendar")
                    }
                    .tint(.blue)
                }
                ToolbarItem {
                    Button {
                        
                    } label: {
                        Image(systemName: "gear")
                    }
                    .tint(.blue)
                }
            }
            .navigationTitle("Regina")
            
            .onAppear {
            }
        }
    }
}

#Preview {
    MainView()
}
