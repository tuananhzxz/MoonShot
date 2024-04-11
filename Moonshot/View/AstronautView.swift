//
//  AstronautView.swift
//  Moonshot
//
//  Created by tuananhdo on 13/09/2023.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut : Astronaut
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.lightTheme)
                    .padding(.vertical)
                
                Text(astronaut.description)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
        }
        .background(.lightTheme)
        .navigationTitle("Astronaut")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    
    static let astronaut : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronaut["armstrong"]!)
    }
}
