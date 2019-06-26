//
//  HarryPotterViewController.swift
//  HarryPotter_API
//
//  Created by julia rodriguez on 6/26/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import UIKit

class HarryPotterViewController: UIViewController {

    @IBOutlet weak var ministryOfMagicText: UILabel!
    
    @IBOutlet weak var orderOfPhoenixText: UILabel!
    
    @IBOutlet weak var dumbedoresArmyText: UILabel!
    
    @IBOutlet weak var deathEaterText: UILabel!
    
    @IBOutlet weak var bloodStatusText: UILabel!
    
    @IBOutlet weak var speciesText: UILabel!
    
    @IBOutlet weak var schoolText: UILabel!
    
    @IBOutlet weak var nameText: UILabel!
    
    @IBOutlet weak var roleText: UILabel!
    
    @IBOutlet weak var houseText: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self

    }
    func updatesViews(character: TopLevelDict) {

            self.ministryOfMagicText.text = String(character.ministryOfMagic)
            self.orderOfPhoenixText.text = String(character.orderOfThePhoenix)
            self.dumbedoresArmyText.text = String(character.dumbledoresArmy)
            self.deathEaterText.text = String(character.deathEater)
            self.bloodStatusText.text = character.bloodStatus
            self.speciesText.text = character.species
            self.schoolText.text = character.school
            self.nameText.text = character.name
            self.roleText.text = character.role
            self.houseText.text = character.house
    
        }

}
extension HarryPotterViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, searchText != "" else { return }
       
        HarryPotterController.sharedInstance.fetchCharacters(searchTerm: searchText) { (character) in
            
            guard let hogwartzCharacter = character else { return }
            DispatchQueue.main.async {
                self.updatesViews(character: hogwartzCharacter)
            }
        }
    
    }
    
}
