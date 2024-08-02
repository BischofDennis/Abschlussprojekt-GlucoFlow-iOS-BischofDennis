//
//  MainView.swift
//  GlucoFlowAbschlussprojekt
//
//  Created by Dennis Bischof on 02.08.24.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
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
                    AddViewGlucose()
                        .tabItem {
                            Label("Hinzufügen",systemImage: "plus.square")
                        }
                    MealView()
                        .tabItem {
                            Label("Essen", systemImage: "fork.knife")
                        }
                    SettingView()
                        .tabItem {
                            Label("Settings", systemImage: "gear")
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
                        viewModel.addButtonTapped()
                    } label: {
                        Image(systemName: "gear")
                    }
                    .tint(.blue)
                }
            }
            .navigationTitle("Regina")
            .sheet(isPresented: $viewModel.setting) {
               SettingView()
            }
            .onAppear {
            }
        }
    }
}

#Preview {
    MainView()
}
