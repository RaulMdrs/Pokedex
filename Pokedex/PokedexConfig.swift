//
//  PokedexConfig.swift
//  Pokedex
//
//  Created by Raul de Medeiros on 18/11/22.
//

import Foundation

struct PokedexConfig{
    
    static func config(path : String) -> Pokedex{
        var pokedex : Pokedex = Pokedex()
        
        let jsonPath = Bundle.main.url(forResource: "\(path)", withExtension: "json")
        
        if let path = jsonPath{
            let jsonData = try? Data(contentsOf: path)
            
            if let data = jsonData{
                
                let decoder = JSONDecoder()
                
                let arrayPokemon = try! decoder.decode([Pokemon].self, from: data)
                
                for pokemon in arrayPokemon{
                    print(pokemon)
                }
                
                pokedex.pokemons = arrayPokemon
            }
        }
        
        return pokedex
    }
}
