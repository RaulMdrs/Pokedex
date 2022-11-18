//
//  Pokemon.swift
//  Pokedex
//
//  Created by Raul de Medeiros on 18/11/22.
//

import Foundation

struct Pokemon : Codable{
    var id : Int
    var name : Name
    var type : [String]
    var base : Base
}
