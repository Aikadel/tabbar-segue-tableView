//
//  ResultMusicViewController.swift
//  tabbar_custom_template_view
//
//  Created by Aigerim on 15.05.2022.
//

import UIKit

class ResultMusicViewController: UIViewController {

    var model: MusicModel?
    
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var musicDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(with: model!)
        
    }
    
    func configure(with model: MusicModel) {
        musicTitle.text = model.title
        musicImage.image = UIImage(named: model.image)
        musicDescription.text = model.description
        }

}
