//
//  ViewController.swift
//  starwars-characters
//
//  Created by Andrew Nicholson on 16/12/2015.
//  Copyright © 2015 Nicholson Media. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var starwarsCharacters = [StarwarsCharacter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        parseStarwarsCSV()
    }
    
    func parseStarwarsCSV() {
        let path = NSBundle.mainBundle().pathForResource("starwars", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let starWarsCharID = Int(row["id"]!)!
                let name = row["identifier"]!
                let swChar = StarwarsCharacter(name: name, swCharId: starWarsCharID)
                starwarsCharacters.append(swChar)
            }
            
            print(rows)
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SWCharCell", forIndexPath: indexPath) as? SWCharCell {
            
            let starWarsCharacter = starwarsCharacters[indexPath.row]
            cell.configureCell(starWarsCharacter)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return starwarsCharacters.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(150, 150)
    }
}

