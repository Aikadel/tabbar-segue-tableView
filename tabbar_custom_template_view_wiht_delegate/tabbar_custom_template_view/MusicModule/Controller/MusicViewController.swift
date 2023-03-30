//
//  MusicViewController.swift
//  tabbar_custom_template_view
//
//  Created by Aigerim on 14.05.2022.
//

import UIKit

class MusicViewController: UIViewController, MusicViewDelegate {

        @IBOutlet private weak var stackView:UIStackView!
        let musics: [MusicModel] = [
            MusicModel(id: 0, title: "Дос-Мукасан", image: "Дос_Мукасан", description: "советский, казахский вокально-инструментальный ансамбль, созданный студентами Казахского политехнического института в 1967 году в Алма-Ате. Основателями ансамбля и его первыми исполнителями были Досым Сулеев, Мурат Кусаинов, Хамит Санбаев, Александр Литвинов (название ансамбля происходило от сокращения имён участников: «Дос» — лидер ансамбля Досым Сулеев, «Му» — Мурат Кусаинов, «Ка» — Камит Санбаев, «Сан» — Саня (Александр) Литвинов) "),
            MusicModel(id: 1, title: "A’Studio", image: "A_Studio", description: "советская, казахская и российская музыкальная поп-группа.Состав группы неоднократно менялся. Группу создал казахский музыкант Байгали Серкебаев, сын оперного певца Ермека Серкебаева. До 1987 года группа аккомпанировала Розе Рымбаевой[1]. В настоящее время в коллективе участвуют пять человек: Байгали Серкебаев, Владимир Миклошич, Кети Топурия (солистка), Евгений Дальский (ударные) и Сергей Кумин (гитарист)."),
            MusicModel(id: 2, title: "Шәмші Қалдаяқов", image: "Kaldayakov", description: "15 августа 1930, совхоз «Тимур», Туркестанский район, Сыр-Дарьинский округ, Казакская АССР, РСФСР, СССР — 29 февраля 1992, Алма-Ата, Казахстан) — казахский композитор, народный артист Казахстана (1991)[1], «король казахского вальса»[2]. В 1956 году написал песню Мой Казахстан, которая впоследствии стала современным гимном Казахстана."),
            MusicModel(id: 3, title: "Батырхан Қамалұлы Шүкенов", image: "Батырхан_Камалович_Шукенов", description: " 18 мая 1962, Кызыл-Орда, Казахская ССР, СССР — 28 апреля 2015, Москва, Россия) — советский, казахский и российский эстрадный певец, музыкант, саксофонист, композитор. Заслуженный деятель искусств Казахстана (2010). Посол доброй воли ЮНИСЕФ в Казахстане (2009—2015). Один из основателей и солист казахско-российской музыкальной поп-группы «А’Студио», в составе которой обрёл широкую популярность (1987—2000). После ухода из группы осенью 2000 года занялся сольной карьерой[5]."),
            MusicModel(id: 4, title: "Рәбиға Есімжанова", image: "Рәбиға_Есімжанова", description: " 5 января 1914 — 3 июля 1986) — советская и казахская певица (меццо-сопрано), заслуженная артистка Казахской ССР (1957), народная артистка Казахской ССР (1967). Одна из основателей школы профессиональных казахских певцов."),
            MusicModel(id: 5, title: "Әміре Қашаубаев", image: "Amre_Kashaubaev", description: "1888, с. Кайнар, Каркаралинский уезд, Семипалатинская область, Российская империя — 6 декабря 1934, Алма-Ата, Казахская ССР, СССР) — казахский советский певец (драматический тенор), актёр, музыкант. Один из основоположников казахского национального театрального искусства.")
        ]

    var musicInformation: MusicModel?
    
        override func viewDidLoad() {
            super.viewDidLoad()
            configureMusics()
        }
        
        private func configureMusics() {
            stackView.arrangedSubviews.forEach { view in
                stackView.removeArrangedSubview(view)
                view.removeFromSuperview()
            }
            for music in musics {
                let musicView = MusicView()
                musicView.delegate = self
                musicView.configure(with: music)
                stackView.addArrangedSubview(musicView)
                stackView.layoutSubviews()
            }
            stackView.layoutIfNeeded()
            
        }
    func onButtonDidTap(with id: Int) {
        print("Button Tapped in ViewController")
        musicInformation = musics[id]
        performSegue(withIdentifier: "showMusic", sender: self)
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMusic" {
            if let musicList = segue.destination as? ResultMusicViewController {
                musicList.model = musicInformation
            }
        }
    }
}

    


