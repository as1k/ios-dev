//
//  BookmarksModel.swift
//  KBTUIntranet
//
//  Created by Асыланбек Нурмухамбет on 3/20/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation
import UIKit

class BookmarksModel {
    
    func getBookmarkedListLength(bookmarked: [NewsItem]) -> Int {
        return bookmarked.count
    }
    
    func getModelCell(_ tableView: UITableView, _ indexPath: IndexPath, bookmarked: [NewsItem]) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookmarkCell")
        cell?.textLabel?.text = bookmarked[indexPath.row].title
        cell?.detailTextLabel?.text = String((bookmarked[indexPath.row].description?.dropFirst(30))!)
        return cell!
    }
}
