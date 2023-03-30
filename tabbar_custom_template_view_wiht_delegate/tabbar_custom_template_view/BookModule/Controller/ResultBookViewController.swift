//
//  ResultBookViewController.swift
//  tabbar_custom_template_view
//
//  Created by Aigerim on 15.05.2022.
//

import UIKit

class ResultBookViewController: UIViewController {

    var model: BookModel?
    
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(with: model!)

    }
    
    func configure(with model:BookModel) {
        bookTitle.text = model.title
        bookImage.image = UIImage (named: model.image)
        bookDescription.text = model.description
    }
   

}
