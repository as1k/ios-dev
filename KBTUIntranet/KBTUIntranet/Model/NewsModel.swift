//
//  NewsModel.swift
//  KBTUIntranet
//
//  Created by Асыланбек Нурмухамбет on 3/13/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation
import UIKit

class NewsModel {
    
    var news: [NewsItem] = [
        NewsItem.init(UIImage.init(named: "mainImage1")!, 3, 4, "Инклюзия образования⚡️","При поддержке Фонда Total в рамках своих обязательств по программе Инклюзия образования молодежи\nФранцузская Школа IFP запускает третий выпуск бесплатный Массовый онлайн курс, который посвящен теме: Энергетический переход: инновации на пути к низкоуглеродному будущему.\nКурс начнется 8 марта и продлится 5 недель.\nЯзык - английский\nЦель курса - понять технические концепции и инновационные задачи декарбонизированного энергобаланаса для смягчения воздействия на климат.\nСреди тематик курса: производство водорода, возобновляемые источники энергии, биотопливо, утилизация газовых выбросов, и другие.\nПриглашаются к участию ученые, докторанты, магистранты.", true),
        NewsItem.init(UIImage.init(named: "mainImage2")!, 11, 2, "❗️ПОСЛЕДНИЙ ДЕНЬ РЕГИСТРАЦИИ❗️", "ПОСЛЕДНИЙ ДЕНЬ РЕГИСТРАЦИИ\nУважаемые абитуриенты! Успейте пройти регистрацию на Республиканскую предметную олимпиаду КБТУ для школьников 10-12 классов и выпускников колледжа! (Граждане РК)\nРегистрация будет закрыта СЕГОДНЯ в 23:59\nУчаствуйте и станьте обладателем гранта КБТУ!", false),
        NewsItem.init(UIImage.init(named: "mainImage3")!, 23, 1, "С 8 марта! 💐","Дорогие женщины, милые дамы! Поздравляем вас с замечательным праздником весны - Международным женским днём💐\n\nЖелаем Вам Крепкого здоровья, бесконечного счастья и радостных моментов! Пусть каждый день будет наполнен улыбками, любовью и заботой!\n\nКоллектив КБТУ\n\nҚұрметті, әрі қымбатты ханымдар! Сіздерді көктемнің тамаша мерекесі - Халықаралық әйелдер күнімен құттықтаймыз💐\n\nСіздерге зор денсаулық, шексіз бақыт және қуанышты сәттер тілейміз! Әр күндеріңіз махаббат пен қамқорлыққа толы болсын!\n\nҚБТУ ұжымы", false),
        NewsItem.init(UIImage.init(named: "mainImage4")!, 24, 7, "РЕЗУЛЬТАТЫ 1 ТУРА❗️❗️","РЕЗУЛЬТАТЫ 1 ТУРА РЕСПУБЛИКАНСКОЙ ПРЕДМЕТНОЙ ОЛИМПИАДЫ КБТУ⚡️\n\nУважаемые участники олимпиады КБТУ среди школьников 10-12 классов и выпускников колледжа! Результаты 1 тура олимпиады уже доступны в Telegram чате KBTU OLYMP 2021❗️Ссылка в сторис\n\nҚБТУ РЕСПУБЛИКАЛЫҚ ПӘНДІК ОЛИМПИАДАСЫНЫҢ 1 ТУРЫНЫҢ НӘТИЖЕЛЕРІ⚡️\n\nҚұрметті 10-12 сынып оқушылары мен колледж түлектері арасындағы ҚБТУ олимпиадасының қатысушылары! Олимпиаданың 1 турының нәтижелері KBTU OLYMP 2021 Telegram чатында қолжетімді❗️", true)
    ]
    
    func getNewsListLength() -> Int {
        return news.count
    }
    
    func incrementViewCount(index: Int) {
        news[index].viewCount!+=1
    }
    
    func incrementLikeCount(item: NewsItem) {
        if item.bookmarkCount != nil {
            item.bookmarkCount!+=1
        }
    }
    
    func decrementLikeCount(item: NewsItem) {
        if item.bookmarkCount != nil && item.bookmarkCount != 0 {
            item.bookmarkCount!-=1
        }
    }
    
    func removeFromBookmarks(_ newsItem: NewsItem) {
        for item in news {
            if (item.equals(newsItem)) {
                item.isBookmarked = !item.isBookmarked
                decrementLikeCount(item: item)
            }
        }
    }

    func getCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell") as? NewsCell
        cell?.mainImageView.image = news[indexPath.row].image
        cell?.viewCountLabel.text = String(news[indexPath.row].viewCount!)
        cell?.bookmarkCountLabel.text = String(news[indexPath.row].bookmarkCount!)
        cell?.titleLabel.text = news[indexPath.row].title
        if news[indexPath.row].isBookmarked {
            cell?.bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        } else {
            cell?.bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
        cell?.actionBlock = {
            if self.news[indexPath.row].isBookmarked {
                self.news[indexPath.row].isBookmarked = false
                cell?.bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
                
                self.decrementLikeCount(item: self.news[indexPath.row])
                cell?.bookmarkCountLabel.text = String.init(self.news[indexPath.row].bookmarkCount!)
            }
            else {
                self.news[indexPath.row].isBookmarked = true
                cell?.bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
                
                self.incrementLikeCount(item: self.news[indexPath.row])
                cell?.bookmarkCountLabel.text = String.init(self.news[indexPath.row].bookmarkCount!)
            }
        }
        return cell!
    }
}
