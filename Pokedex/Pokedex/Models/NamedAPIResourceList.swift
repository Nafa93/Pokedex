//
//  NamedAPIResourceList.swift
//  Pokedex
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 2/10/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

import Foundation

class NamedAPIResourceList: Codable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [NamedAPIResource]?
}

class NamedAPIResource: Codable {
    var name: String?
    var url: String?
}
