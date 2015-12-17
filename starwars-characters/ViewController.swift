//
//  ViewController.swift
//  starwars-characters
//
//  Created by Andrew Nicholson on 16/12/2015.
//  Copyright © 2015 Nicholson Media. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchbar: UISearchBar!
    
    var starwarsCharacters = [StarwarsCharacter]()
    var filteredSWCharacters = [StarwarsCharacter]()
    var musicPlayer: AVAudioPlayer!
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        searchbar.delegate = self
        searchbar.returnKeyType = UIReturnKeyType.Done
        initAudio()
        parseStarwarsCSV()
    }
    
    func initAudio(){
        let path = NSBundle.mainBundle().pathForResource("swtheme", ofType: "mp3")!
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path))
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
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
            
            let starWarsCharacter: StarwarsCharacter!
            
            if inSearchMode {
                starWarsCharacter = filteredSWCharacters[indexPath.row]
            } else {
                starWarsCharacter = starwarsCharacters[indexPath.row]
            }
            
            cell.configureCell(starWarsCharacter)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredSWCharacters.count
        }
        
        return starwarsCharacters.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(150, 150)
    }
    
    @IBAction func musicButtonPressed(sender: UIButton) {
        
        if musicPlayer.playing {
            musicPlayer.stop()
            sender.alpha = 0.2
        } else {
            musicPlayer.play()
            sender.alpha = 1.0
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercaseString
            
            filteredSWCharacters = starwarsCharacters.filter({$0.loweredName.rangeOfString(lower) != nil})
        }
        
        collection.reloadData()
    }
}

