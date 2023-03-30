//
//  BookViewController.swift
//  tabbar_custom_template_view
//
//  Created by Aigerim on 14.05.2022.
//

import UIKit

class BookViewController: UIViewController, BookViewDelegate {

    @IBOutlet private weak var stackView: UIStackView!
    let books: [BookModel] = [
        BookModel(id: 0, title: "Көшпенділер", image: "Көшпенділер", description: "«Көшпенділер» – Ілияс Есенберлиннің үш кітаптан тұратын тарихи эпопеясы. Бұл шығарма – қазақ сөз өнерінің әлемдік нұсқасына қосылған тарихты көркемдік пайымдаудың үздік үлгілерінің бірі, партиялық идеологияның қылышынан қан тамып тұрған уақытта дүниеге келген шығарма. Трилогия «Алмас қылыш», «Жанталас», «Қаһар» деген бөлімдерден тұрады. «Көшпенділер» трилогиясында бес ғасырлық оқиға, яғни XV–XIX ғасыр аралығындағы Қазақ хандығының кезеңі суреттеледі. Шығарма кейіпкерлері, негізінен, тарихи тұлғалар, Шыңғыс хан дәуірінен басталып, Кенесарымен аяқталатын қазақ мемлекетінің бастау көзі мен қиын-қыстау тағдыр-талайының басында тұрған хандар тізбегі, ел мұңы мен арман-тілегінің хабаршысы – ақын-жыраулар, ел мен жер үшін, ұрпақ болашағы үшін жан аямай шайқасып, Отанын қорғай білген батырлар. Бұлар ел есінде аттары жатталып, тарихта қалған, өмірде болған тұлғалар."),
        BookModel(id: 1, title: "Мың сұрақ", image: "Мың_сұрақ", description: "Бұл кітап ертегі және аңыз жанрында құрастырылған. Мәлике деген Ұрым патшасы мың сұрақ қояды. Оған Әбілда есімді оқымысты жауап береді. Мың сұрақта аңыз, қисса, тәлім-тәрбие, шешендік сөздер, экзистенциялық ойлар қамтылған. Кітап этнопедагогика ғылымына қызығатын мектеп оқушыларына, студенттерге және ізденуші ғалымдарға арналады."),
        BookModel(id: 2, title: "Бас", image: "Бас", description: "Қазақ түсінігінде бас – символикалық тұрғыдан билікті, еркіндікті білдіретін ұғым. Бассыз қалу дегеніміз еркіндігіңнен айырылумен бірдей. Әлемдік әдебиетте денесіз қалған басты, яки басы жоқ денені сөйлету кең таралған тәсіл. Шығыстық үлгідегі дастандарда бас адамның тойымсыз нәпсісін, жан мен тәннің майданын бейнелесе, отарланған халықтың әдебиетінде бас еркіндік пен отарлық езгіні көрсететін символ. Роман желісі бойынша Мәскеуден білім алған Ноэль есімді антрополог ғалым XIX ғасырда Ресейдің отарлау саясатына қарсы шығып, еркіндік үшін күресіп, бассыз қалған Махамбеттің зиратын қазу үшін қазақ даласына келеді. Автор мұнда Махамбеттің басын ғана емес, ұлттың отарлықтан жоғалтқан мінезін, рухын іздейді. Ақынның жоғалған басына миллион доллар қаражат берілетіндігін естіген арам пиғылды жандардың жан ұшыра Басты іздеуге кіріскен оқиғасы арқылы автор ұлттық құндылықтар аяққа тапталған, кие ұғымы, әруақ, баба секілді қасиетті түсініктер ысырылып қалған нарықтық қоғамның бейнесін ашып көрсетеді. "),
        BookModel(id: 3, title: "Бес әңгіме", image: "Бес_әңгіме", description: "Бұл кітапта француз жазушысы Ги де Мопассанның бірнеше шығармасы берілген. Бұл шығармалар 1935-1937 жыл аралығында қазақшаға аударылыпты. «Бес әңгіме», «Томпыш», «Франсуаза» деген атпен үш кітап жарық көрген. Одан бөлек 1925 жылдары «Қазақ», «Әйел теңдігі», «Ақ жол» деген газеттерінде «Қыр баласы» деген атпен Әлихан Бөкейханұлының аудармалары да жарияланыпты. Сол еңбектерді жинап, қайта ұсынып отырмыз. Бұл кітап әлемдік классикаға қызығатын, көкірегін құндылыққа толтырғысы келетін барша оқырманға арналады."),
        BookModel(id: 4, title: "Асыл сөз", image: "Асыл_сөз", description: "Сұлтанмахмұт Торайғыров поэма жанрына өзіндік үн қосты. Сюжетсіз поэмаларымен қоғамда болып жатқан мәселелерді кеңінен қамтыды. Поэмалар желісі өзі өмір сүрген қоғам мен әділдік таппай жүрген халық, өзінің шығармашылық жолын көрсетті."),
        BookModel(id: 5, title: "Ойсыл қара", image: "Ойсыл_қара", description: "«Ойсыл қара» – жазушы, Қазақстанның еңбек сіңірген қайраткері Смағұл Елубаевтың тұңғыш кітабы. Жинақ жан-жануарлар туралы әңгімеден құралған. «Тарзан» атты әңгімесінде бір жоғалған иттің тағыға айналу тарихы баяндалады. Ал жартылай қиялға құрылған «Ұлу» деген хикаясында қасқыр асыраған жас баланың қайғылы халі суреттеледі. Автор қай шығармасында болса да өмір туралы символикалық ой түюге ұмтылады")
    ]

    var bookInformation: BookModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBooks()
    }
    
    private func configureBooks() {
        stackView.arrangedSubviews.forEach { view in
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        for book in books {
            let bookView = BookView()
            bookView.delegate = self
            bookView.configure(with: book)
            stackView.addArrangedSubview(bookView)
            stackView.layoutSubviews()
        }
        stackView.layoutIfNeeded()
        
        
    }
    
    func onButtonDidTap(with id: Int) {
        print("Button Tapped in ViewController")
        bookInformation = books[id]
        performSegue(withIdentifier: "showBook", sender: self)
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBook" {
            if let bookList = segue.destination as? ResultBookViewController {
                bookList.model = bookInformation
            }
        }
    }
}