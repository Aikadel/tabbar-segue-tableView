//
//  BookView.swift
//  tabbar_custom_template_view
//
//  Created by Aigerim on 15.05.2022.
//

import UIKit
protocol BookViewDelegate: AnyObject { //создаем протокол
    func onButtonDidTap(with id: Int)
}
class BookView: NibView {
    
    private var id: Int!
    
    weak var delegate: BookViewDelegate?// обязательно надо прописывать weak, не забыть опшионал(?)

    @IBOutlet private weak var bookTitle: UILabel!
    @IBOutlet private weak var bookImage: UIImageView!
    @IBOutlet private weak var bookButton: UIButton!
    
    override func configure() {
        contentView.backgroundColor = .systemGray6
        bookButton.backgroundColor = .systemGray3
    }
    
    @IBAction func buttobuttonDidTap(_ sender: UIButton){
        print("Button tapped in BookView")
        delegate?.onButtonDidTap(with: id)
    }
    
func configure(with model: BookModel) {
    bookTitle.text = model.title
    bookImage.image = UIImage(named: model.image)
    id = model.id
    }
}


