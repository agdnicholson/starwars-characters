//
//  StarwarsCharacter.swift
//  starwars-characters
//
//  Created by Andrew Nicholson on 16/12/2015.
//  Copyright © 2015 Nicholson Media. All rights reserved.
//

import Foundation

class StarwarsCharacter {
    private var _name: String!
    private var _swCharId: Int!
    
    var name: String {
        return _name
    }
    
    var swCharId: Int {
        return _swCharId
    }
    
    init(name: String, swCharId: Int){
        self._name = name
        self._swCharId = swCharId
    }
}