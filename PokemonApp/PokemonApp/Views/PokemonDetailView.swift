//
//  PokemonDetailView.swift
//  PokemonApp
//
//  Created by Gaurav Semwal on 18/03/25.
//

import SwiftUI
import Kingfisher

struct PokemonDetailView: View {
    let viewModel: PokemonViewModel
    let pokemon: Pokemon
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(viewModel.backgroundColor(forType: pokemon.type)).opacity(0.6), Color(viewModel.backgroundColor(forType: pokemon.type)).opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(alignment: .leading) {
                
                //Pokemon image
                KFImage(URL(string: pokemon.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(viewModel.backgroundColor(forType: pokemon.type)), radius: 5)
                    .frame(width: 250, height: 250, alignment: .center)
                    .padding()
                    .padding(.leading, 20)
                
                
                HStack {
                    //Pokemon Name
                    Text(pokemon.name.capitalized)
                        .font(.title)
                        .font(.system(size: 28, weight: .bold, design: .serif))
                    
                    //Pokemon Type
                    Text(pokemon.type.capitalized)
                        .font(.system(size: 16, weight: .medium, design: .serif))
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(Color(viewModel.backgroundColor(forType: pokemon.type)).opacity(0.3))
                        )
                        .frame(width: 100, height: 24)
                }.padding(.leading)
                
                //Pokemon Description
                Text(pokemon.description)
                    .font(.system(size: 20, weight: .regular, design: .serif))
                
                Divider()
                
                //Pokemon other Details
                VStack(alignment:.leading) {
                    
                    // created small view to avoid repeatation
                    Details(key: "Type :", value: pokemon.type.capitalized, image: "cloud.sun.bolt.fill")
                    Details(key: "Height :", value: "\(pokemon.height)", image: "staroflife.circle.fill")
                    Details(key: "Weight :", value: "\(pokemon.weight) ", image: "sparkles" )
                    Details(key: "Attack :", value: "\(pokemon.attack)", image: "tropicalstorm")
                    Details(key: "Defense :", value: "\(pokemon.defense)", image: "bonjour")
                }.padding()
                
                
            }.frame(width: 330, height: 670, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .padding(.all, 8)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(color: .black.opacity(0.3), radius: 8, x: 8, y: 8)
                .shadow(color: .white.opacity(0.6), radius: 10, x: -10, y: -10)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct Details: View {
    
    let key: String
    let value: String
    let image: String
    
    var body: some View {
        HStack(spacing: 10 ) {
            Image(systemName: image)
                .font(.system(size: 18, weight: .semibold, design: .serif))
            Text(key)
                .font(.system(size: 18, weight: .semibold, design: .serif))
            Text(value)
                .font(.system(size: 16, weight: .semibold, design: .serif))
        }
    }
}

#Preview {
    PokemonDetailView(viewModel: sampleVM, pokemon: samplePoke)
}
