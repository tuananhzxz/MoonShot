//
//  Bundle - Decodable.swift
//  Moonshot
//
//  Created by tuananhdo on 12/09/2023.
//

import Foundation

extension Bundle {
    
    func decode<T : Codable>(_ file : String) -> T {
        
        guard let url = url(forResource: file, withExtension: nil) else  {
            fatalError("Failed to load \(file) bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to locate \(file) bundle.")
        }
        
        let decoder = JSONDecoder()
        let formatted = DateFormatter()
        formatted.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatted)
        
        guard let loader = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to load \(file) bundle")
        }
        
        return loader
    }
    
}
