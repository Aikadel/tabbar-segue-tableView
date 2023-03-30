//
//  MusicView.swift
//  tabbar_custom_template_view
//
//  Created by Aigerim on 14.05.2022.
//

import UIKit

protocol MusicViewDelegate: AnyObject { //создаем протокол
    func onButtonDidTap(with id: Int)
}

class MusicView: NibView {
    
    private var id: Int!
    
    weak var delegate: MusicViewDelegate?// обязательно надо прописывать weak, не забыть опшионал(?)
    
    @IBOutlet private weak var musicTitle:UILabel!
    @IBOutlet private weak var musicImage:UIImageView!
    @IBOutlet private weak var musicButton: UIButton!
       
    override func configure() {
            contentView.backgroundColor = .systemGray6
            musicButton.backgroundColor = .systemGray3
        }
        
    @IBAction func buttobuttonDidTap(_ sender: UIButton){
        print("Button tapped in MusicView")
        delegate?.onButtonDidTap(with: id)
    }
        
    func configure(with model: MusicModel) {
        musicTitle.text = model.title
        musicImage.image = UIImage(named: model.image)
        id = model.id
        }
    }
