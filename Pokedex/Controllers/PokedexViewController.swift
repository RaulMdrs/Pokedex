//
//  ViewController.swift
//  Pokedex
//
//  Created by Julia Eileen Schäfer on 18/11/22.
//
import UIKit

class PokedexViewController: UIViewController {
    @IBOutlet weak var pokemonsTableView: UITableView!
    var pokedex : Pokedex?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pokedex"
        pokemonsTableView.delegate = self
        pokemonsTableView.dataSource = self
        pokedex = PokedexConfig.config(path: "pokedex")
    }
}

extension PokedexViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (pokedex?.pokemons.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pokemonsTableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonCell
        
        cell.config(pokemon: (pokedex?.pokemons[indexPath.row])!)
        return cell
    }
}

extension PokedexViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemonStoryboard: UIStoryboard = UIStoryboard(name: "PokemonScreen", bundle: nil)
        
        let pokemonViewController = pokemonStoryboard.instantiateViewController(withIdentifier: "pokemonView") as! PokemonViewController
        
        pokemonViewController.pokemon = pokedex?.pokemons[indexPath.row]

        self.navigationController?.pushViewController(pokemonViewController, animated: true)
    }
}
