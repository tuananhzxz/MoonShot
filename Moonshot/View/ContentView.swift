//
//  ContentView.swift
//  Moonshot
//
//  Created by tuananhdo on 11/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    let astronaut : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions : [Mission] = Bundle.main.decode("missions.json")
    
    let collums = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var showingGrid = false
    
    var body: some View {
            NavigationView {
                if showingGrid {
                    ScrollView {
                        
                        LazyVGrid(columns: collums) {
                            
                            ForEach(missions) { mission in
                                
                                NavigationLink {
                                    MissionView(mission: mission,astronauts: astronaut)
                                } label: {
                                    VStack {
                                        Image(mission.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .padding()
                                        
                                        VStack {
                                            Text(mission.displayName)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                            
                                            Text(mission.formattedLaunchDate)
                                                .font(.headline)
                                                .foregroundColor(.init(white: 0.5))
                                        }
                                        .padding(.vertical)
                                        .frame(maxWidth : .infinity)
                                        .background(.lightTheme)
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.lightTheme)
                                    }
                                }
                                .padding([.horizontal, .bottom])
                            }
                        }
                        .navigationTitle("Moon Shets")
                        .backgroundStyle(.darkTheme)
                        .preferredColorScheme(.dark)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Toggle(isOn : $showingGrid){
                                    Label(showingGrid ? "Grid" : "List", systemImage: showingGrid ? "square.grid.2x2.fill" : "list.bullet")
                                }
                            }
                        }
                    }
                } else {
                    List() {
                        ForEach(missions) { mission in
                            
                            NavigationLink {
                                
                                MissionView(mission: mission, astronauts: astronaut)
                                
                            } label: {
                                
                                Image(mission.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.headline)
                                        .foregroundColor(.init(white: 0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth : .infinity)
                                .background(.lightTheme)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(.lightTheme)
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                    .navigationTitle("Moon Shets")
                    .backgroundStyle(.darkTheme)
                    .preferredColorScheme(.dark)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Toggle(isOn: $showingGrid) {
                                Label(showingGrid ? "Grid" : "List", systemImage: showingGrid ? "square.grid.2x2.fill" : "list.bullet")
                            }
                        }
                    }
                }
                
            }
        
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
