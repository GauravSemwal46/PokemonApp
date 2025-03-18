//
//  PokemonModel.swift
//  PokemonApp
//
//  Created by Gaurav Semwal on 18/03/25.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let weight: Int
    let height: Int
    let attack: Int
    let defense: Int
    let description: String
}
