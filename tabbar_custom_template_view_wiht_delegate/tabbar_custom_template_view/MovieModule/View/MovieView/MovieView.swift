//
//  MovieView.swift
//  tabbar_custom_template_view
//
//  Created by Aigerim on 14.05.2022.
//

import UIKit

protocol MovieViewDelegate: AnyObject { //создаем протокол
    func onButtonDidTap(with id: Int)
}
class MovieView: NibView {
    
    private var id: Int!
    
    weak var delegate: MovieViewDelegate?// обязательно надо прописывать weak, не забыть опшионал(?)
    @IBOutlet private weak var movieTitle: UILabel!
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieButton: UIButton!

        
        override func configure() {
            contentView.backgroundColor = .systemGray6
            movieButton.backgroundColor = .systemGray3
        }
        
    @IBAction func buttobuttonDidTap(_ sender: UIButton){
        print("Button tapped in MovieView")
        delegate?.onButtonDidTap(with: id)
    }
    
    func configure(with model: MovieModel) {
        movieTitle.text = model.title
        movieImage.image = UIImage(named: model.image)
        id = model.id
        }
    }
