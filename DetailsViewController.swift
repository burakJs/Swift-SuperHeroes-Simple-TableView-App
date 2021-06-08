//
//  DetailsViewController.swift
//  SuperHeroesBook
//
//  Created by Burak İmdat on 8.06.2021.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var heroLabel: UILabel!
    
    var selectedHeroName = ""
    var selectedHeroImage = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heroLabel.text = selectedHeroName
        imageView.image = UIImage(named: selectedHeroImage)
    }

}
