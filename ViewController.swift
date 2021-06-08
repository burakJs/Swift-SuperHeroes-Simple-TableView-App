//
//  ViewController.swift
//  SuperHeroesBook
//
//  Created by Burak İmdat on 8.06.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var superHeroesNames = [String]()
    var superHeroesImages = [String]()
    var selectedName:String = ""
    var selectedImage:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        superHeroesNames.append("Batman")
        superHeroesNames.append("Superman")
        superHeroesNames.append("Iron Man")
        superHeroesNames.append("Captain America")
        superHeroesNames.append("Spiderman")
        
        superHeroesImages.append("batman")
        superHeroesImages.append("superman")
        superHeroesImages.append("ironman")
        superHeroesImages.append("captainamerica")
        superHeroesImages.append("spiderman")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroesNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superHeroesNames[indexPath.row]
        cell.textLabel?.font = UIFont(name: UIFont.familyNames[1], size: 32)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            superHeroesNames.remove(at: indexPath.row)
            superHeroesImages.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         selectedName = superHeroesNames[indexPath.row]
         selectedImage = superHeroesImages[indexPath.row]
        
        performSegue(withIdentifier: "toDetailsVC" , sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedHeroName = selectedName
            destinationVC.selectedHeroImage = selectedImage
        }else {
            print("WTF")
        }
    }
}

