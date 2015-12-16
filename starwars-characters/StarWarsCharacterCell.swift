//
//  StarWarsCharacterCell.swift
//  starwars-characters
//
//  Created by Andrew Nicholson on 16/12/2015.
//  Copyright © 2015 Nicholson Media. All rights reserved.
//

import UIKit

class StarWarsCharacterCell: UICollectionViewCell {
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var starwarsCharacter: StarwarsCharacter!
    
    func configureCell(starwarsCharacter: StarwarsCharacter) {
        self.starwarsCharacter = starwarsCharacter
        
        nameLbl.text = self.starwarsCharacter.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.starwarsCharacter.swCharId)")
    }
}
