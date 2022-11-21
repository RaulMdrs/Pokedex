//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Raul de Medeiros on 18/11/22.
//

import UIKit

class PokemonViewController: UIViewController {
    var pokemon : Pokemon? = nil
    
    @IBOutlet weak var statsView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var healthBaseLabel: UILabel!
    @IBOutlet weak var attackBaseLabel: UILabel!
    @IBOutlet weak var spAttackBaseLabel: UILabel!
    @IBOutlet weak var spDefenseLabel: UILabel!
    @IBOutlet weak var defenseBaseLabel: UILabel!
    @IBOutlet weak var speedBaseLabel: UILabel!
    @IBOutlet weak var secondTypeLabel: UILabel!
    @IBOutlet weak var firstTypeLabel: UILabel!
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self.title = pokemon!.name.english
        configLayout()
    }
    
    
    func configLayout(){
        
        configLabels(pokemon: pokemon!)
        
        configImage()
        
        configBackground()
    }
    
    
    func configLabels(pokemon : Pokemon){
        
        if pokemon.type.count == 2{
            firstTypeLabel.text = pokemon.type[0]
            firstTypeLabel.backgroundColor = UIColor(named: pokemon.type[0].lowercased())
            firstTypeLabel.isHidden = false
            
            secondTypeLabel.text = pokemon.type[1]
            secondTypeLabel.backgroundColor = UIColor(named: pokemon.type[1].lowercased())
            secondTypeLabel.isHidden = false
            
        }else{
            firstTypeLabel.backgroundColor = UIColor(named: pokemon.type[0].lowercased())
            firstTypeLabel.isHidden = false
            firstTypeLabel.text = pokemon.type[0]
            
            secondTypeLabel.backgroundColor = .clear
            secondTypeLabel.text = ""
            secondTypeLabel.isHidden = true
        }
        
        firstTypeLabel.layer.cornerRadius = 15.0
        secondTypeLabel.layer.cornerRadius = 15.0
        
        firstTypeLabel.layer.masksToBounds = true
        secondTypeLabel.layer.masksToBounds = true
        
        healthBaseLabel.text = "\(pokemon.base.hp)"
        
        attackBaseLabel.text = "\(pokemon.base.attack)"
        spAttackBaseLabel.text = "\(pokemon.base.spAttack)"
        
        defenseBaseLabel.text = "\(pokemon.base.defense)"
        spDefenseLabel.text = "\(pokemon.base.spDefense)"
        
        speedBaseLabel.text = "\(pokemon.base.speed)"
    }
    
    func configImage()
    {
        if pokemon!.id < 10{
            pokemonImage.image = UIImage(named: "00\(pokemon!.id)")
        }else if pokemon!.id < 100{
            pokemonImage.image = UIImage(named: "0\(pokemon!.id)")
        }else{
            pokemonImage.image = UIImage(named: "\(pokemon!.id)")
        }
    }
    
    func configBackground()
    {
        statsView.layer.cornerRadius = 19.0
        statsView.layer.masksToBounds = true
        
        var color : UIColor = UIColor(named: pokemon!.type[0].lowercased())!
        backgroundView.backgroundColor = color.withAlphaComponent(0.8)
    }
    
}
