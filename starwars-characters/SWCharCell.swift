//
//  StarWarsCharacterCell.swift
//  starwars-characters
//
//  Created by Andrew Nicholson on 16/12/2015.
//  Copyright © 2015 Nicholson Media. All rights reserved.
//

import UIKit

class SWCharCell: UICollectionViewCell {
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var starwarsCharacter: StarwarsCharacter!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5.0
    }
    
    func configureCell(starwarsCharacter: StarwarsCharacter) {
        self.starwarsCharacter = starwarsCharacter
        
        nameLbl.text = self.starwarsCharacter.name
        thumbImg.image = UIImage(named: "\(self.starwarsCharacter.swCharId)")
    }
}
