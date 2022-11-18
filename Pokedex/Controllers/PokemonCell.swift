//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Raul de Medeiros on 18/11/22.
//

import UIKit

class PokemonCell: UITableViewCell {

    
    @IBOutlet weak var namePokemonLabel: UILabel!
    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var secondTypeLabel: UILabel!
    @IBOutlet weak var firstTypeLabel: UILabel!
    
    
    func config(pokemon : Pokemon){
       
        if pokemon.type.count == 2{
            firstTypeLabel.text = pokemon.type[0]
            secondTypeLabel.text = pokemon.type[1]
            
            firstTypeLabel.backgroundColor = UIColor(named: pokemon.type[0].lowercased())
            secondTypeLabel.backgroundColor = UIColor(named: pokemon.type[1].lowercased())
            
        }else{
            firstTypeLabel.text = pokemon.type[0]
            
            secondTypeLabel.backgroundColor = .clear
            secondTypeLabel.text = ""
        }
        firstTypeLabel.layer.cornerRadius = 15.0
        secondTypeLabel.layer.cornerRadius = 15.0
        
        firstTypeLabel.layer.masksToBounds = true
        secondTypeLabel.layer.masksToBounds = true
        
        namePokemonLabel.text! = pokemon.name.english
        
        if pokemon.id < 10{
            imagePokemon.image = UIImage(named: "00\(pokemon.id)")
        }else if pokemon.id < 100{
            imagePokemon.image = UIImage(named: "0\(pokemon.id)")
        }else{
            imagePokemon.image = UIImage(named: "\(pokemon.id)")
        }
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
