//
//  ViewController.swift
//  tabbar_custom_template_view
//
//  Created by Aigerim on 14.05.2022.
//

import UIKit

class MovieViewController: UIViewController, MovieViewDelegate {
    
    @IBOutlet private weak var stackView: UIStackView!
    let movies: [MovieModel] = [
        MovieModel(id: 0, title: "Томирис", image: "Томирис", description: "казахстанский художественный фильм режиссёра Акана Сатаева, рассказывающий о царице массагетов и Кире Великом. Премьера фильма состоялась в сентябре 2019 года. Фильм основан на рассказанной Геродотом истории о гибели царя персов Кира Великого во время войны с массагетами, которыми командовала царица Томирис."),
        MovieModel(id: 1, title: "Войско Мын Бала", image: "Мын_бала", description: "Действие кинокартины происходит в первой половине XVIII века – в переломную эпоху казахской истории, когда в кровопролитной войне с джунгарами единство казахского народа и героизм становятся решающей силой на пути к обретению свободы."),
        MovieModel(id: 2, title: "Кочевник", image: "Кочевник", description: "Герой Мансур, ставший Аблай-ханом, проходит все испытания подлинного народного полководца, но при этом не теряет притягательных личных черт, благодаря его любви к девушке–воину Гаухар."),
        MovieModel(id: 3, title: "Время патриотов", image: "Время_патриотов", description: "Братья Султан и Бекзат продолжают семейную традицию: старший, Султан, — доблестный офицер разведки, младший — талантливый летчик-истребитель. Их отец погиб при исполнении, но память о нем и служба — единственное, что объединяет братьев, которые никак не могут найти общий язык. Когда безопасности страны угрожает международная террористическая группировка, братьям приходится объединиться ради спасения человеческих жизней и осознать, что семья, любимые и Родина — самое ценное, что у них есть."),
        MovieModel(id: 4, title: "Нартай", image: "Нартай", description: "1990-е. Эдик Петров угоняет танк Т-72 вместе с его водителем, Нартаем Сапаргалиевым, из СССР в Германию. И если Эдик мечтал уехать из страны, в будущее которой он не верит, то Нартай очень хочет на родину. Пока командование думает, как его вытащить из Баварии, Нартай не сидит без дела и помогает окружающим."),
        MovieModel(id: 5, title: "Нулевой пациент", image: "Нулевой_пациент", description: "Врач в Элисте сталкивается с первой вспышкой ВИЧ в СССР. Сериал про людей перед лицом неизвестности")
    ]

    var movieInformation: MovieModel?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMovies()
    }
    
 
    private func configureMovies() {
        stackView.arrangedSubviews.forEach { view in
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        for movie in movies {
            let movieView = MovieView()
            movieView.delegate = self
            movieView.configure(with: movie)
            stackView.addArrangedSubview(movieView)
            stackView.layoutSubviews()
           
        }
        stackView.layoutIfNeeded()
    
    }
    
    func onButtonDidTap(with id: Int) {
        print("Button Tapped in ViewController")
        movieInformation = movies[id]
        performSegue(withIdentifier: "showMovie", sender: self)
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovie" {
            if let movieList = segue.destination as? ResultMovieViewController {
                movieList.model = movieInformation
            }
        }
    }
}

