//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Raul de Medeiros on 18/11/22.
//

import UIKit

class PokemonViewController: UIViewController {
    var pokemon : Pokemon? = nil
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var healthBaseLabel: UILabel!
    @IBOutlet weak var attackBaseLabel: UILabel!
    @IBOutlet weak var spAttackBaseLabel: UILabel!
    @IBOutlet weak var spDefenseLabel: UILabel!
    @IBOutlet weak var defenseBaseLabel: UILabel!
    @IBOutlet weak var speedBaseLabel: UILabel!
    @IBOutlet weak var secondTypeLabel: UILabel!
    @IBOutlet weak var firstTypeLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configLayout()
    }
    
    
    func configLayout(){
        if pokemon!.id < 10{
            pokemonImage.image = UIImage(named: "00\(pokemon!.id)")
        }else if pokemon!.id < 100{
            pokemonImage.image = UIImage(named: "0\(pokemon!.id)")
        }else{
            pokemonImage.image = UIImage(named: "\(pokemon!.id)")
        }
        
        if pokemon!.type.count == 2{
            firstTypeLabel.text = pokemon!.type[0]
            secondTypeLabel.text = pokemon!.type[1]
            
            firstTypeLabel.backgroundColor = UIColor(named: pokemon!.type[0].lowercased())
            secondTypeLabel.backgroundColor = UIColor(named: pokemon!.type[1].lowercased())
            
        }else{
            firstTypeLabel.text = pokemon!.type[0]
            
            secondTypeLabel.backgroundColor = .clear
            secondTypeLabel.text = ""
        }
        firstTypeLabel.layer.cornerRadius = 15.0
        secondTypeLabel.layer.cornerRadius = 15.0
        
        firstTypeLabel.layer.masksToBounds = true
        secondTypeLabel.layer.masksToBounds = true
        
        pokemonNameLabel.text! = pokemon!.name.english
        
        healthBaseLabel.text = "\(pokemon!.base.hp)"
        
        attackBaseLabel.text = "\(pokemon!.base.attack)"
        spAttackBaseLabel.text = "\(pokemon!.base.spAttack)"
        
        defenseBaseLabel.text = "\(pokemon!.base.defense)"
        spDefenseLabel.text = "\(pokemon!.base.spDefense)"
        
        speedBaseLabel.text = "\(pokemon!.base.speed)"
    }
    
}
