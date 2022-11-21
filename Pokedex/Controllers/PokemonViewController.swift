//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Raul de Medeiros on 18/11/22.
//

import UIKit

class PokemonViewController: UIViewController {
    var pokemon : Pokemon? = nil
    var pokedex : Pokedex? = nil
    
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
    @IBOutlet weak var previusPokemonButton: UIButton!
    @IBOutlet weak var nextPokemonButton: UIButton!
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        configLayout()
        
    }
    
    @IBAction func previusPokemonPressed(_ sender: UIButton) {
        pokemon = pokedex?.pokemons[pokemon!.id - 2]
        nextPokemonButton.isHighlighted = false
        configLayout()
    }
    
    @IBAction func nextPokemonPressed(_ sender: UIButton) {
        print(pokemon!.id)
        pokemon = pokedex?.pokemons[pokemon!.id]
        nextPokemonButton.isHighlighted = false
        configLayout()
    }
    
    func configLayout(){
        self.title = pokemon!.name.english
        
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
        if pokemon!.id == 1{
            pokemonImage.image = UIImage(named: (String(format: "%.3d", pokemon!.id)))
            nextPokemonButton.imageView?.image = UIImage(named: (String(format: "%.3d", pokemon!.id + 1)))
            previusPokemonButton.isHidden = true
        }
        else if pokemon!.id < 100{
            previusPokemonButton.isHidden = false
            nextPokemonButton.isHidden = false
            
            pokemonImage.image = UIImage(named: (String(format: "%.3d", pokemon!.id)))
            previusPokemonButton.imageView?.image = UIImage(named: (String(format: "%.3d", pokemon!.id - 1)))
            nextPokemonButton.imageView?.image = UIImage(named: (String(format: "%.3d", pokemon!.id + 1)))
            
        }else{
            pokemonImage.image = UIImage(named: (String(format: "%.3d", pokemon!.id)))
            previusPokemonButton.imageView?.image = UIImage(named: (String(format: "%.3d", pokemon!.id - 1)))
            nextPokemonButton.isHidden = true
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
