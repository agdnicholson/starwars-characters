//
//  SWCharDetailVC.swift
//  starwars-characters
//
//  Created by Andrew Nicholson on 21/12/2015.
//  Copyright © 2015 Nicholson Media. All rights reserved.
//

import UIKit

class SWCharDetailVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    var swCharacter: StarwarsCharacter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = swCharacter.name
    }
}
