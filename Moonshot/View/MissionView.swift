//
//  MissionView.swift
//  Moonshot
//
//  Created by tuananhdo on 12/09/2023.
//

import SwiftUI

struct MissionView: View {
    
    struct crewMember {
        let role : String
        let astronaut : Astronaut
    }
    
    let mission : Mission
    let crew : [crewMember]
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth : geometry.size.width * 0.6)
                        .padding(.top)
                
                    VStack(alignment: .leading) {
                        
                        Text(mission.formattedLaunchDate)
                            .foregroundColor(.white)
                            .padding(.top)
                        
                    }
                    .padding(.horizontal)

                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.lightTheme)
                        .padding(.vertical)
                    
                    
                    
                    VStack(alignment: .leading) {
                        Text("Mission Hightlight")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightTheme)
                            .padding(.vertical)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.horizontal)
                        
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            ForEach(crew, id : \.role) { crewMember in
                                NavigationLink {
                                    AstronautView(astronaut: crewMember.astronaut)
                                } label: {
                                    HStack {
                                        
                                        Image(crewMember.astronaut.id)
                                            .resizable()
                                            .frame(width: 104, height: 72)
                                            .clipShape(Capsule())
                                            .overlay {
                                                Capsule()
                                                    .strokeBorder(.white, lineWidth: 1)
                                            }
                                        
                                        
                                        VStack(alignment: .leading) {
                                            
                                            Text(crewMember.astronaut.name)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                            
                                            Text(crewMember.role)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                        
                    }
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkTheme)
    }
    
    init(mission: Mission, astronauts: [String : Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            
            if let astronaut = astronauts[member.name] {
                return crewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    
    static let mission : [Mission] = Bundle.main.decode("missions.json")
    static let astronaut : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: mission[0],astronauts: astronaut)
            .preferredColorScheme(.dark)
    }
}
