//
//  ResultMovieViewController.swift
//  tabbar_custom_template_view
//
//  Created by Aigerim on 15.05.2022.
//

import UIKit

class ResultMovieViewController: UIViewController {
    
    var model: MovieModel?
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieDescription: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(with: model!)
        
    }
    
    func configure(with model: MovieModel) {
        movieTitle.text = model.title
        movieImage.image = UIImage(named: model.image)
        movieDescription.text = model.description
        }
}

