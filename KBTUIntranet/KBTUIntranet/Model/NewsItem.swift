//
//  NewsItem.swift
//  KBTUIntranet
//
//  Created by Асыланбек Нурмухамбет on 3/13/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation
import UIKit

class NewsItem {
    var image: UIImage?
    var viewCount: Int?
    var bookmarkCount: Int?
    var title: String?
    var description: String?
    var isBookmarked: Bool = false
    
    init(_ image: UIImage, _ viewCount: Int, _ bookmarkCount: Int, _ title: String, _ description: String, _ isBookmarked: Bool) {
        self.image = image
        self.viewCount = viewCount
        self.bookmarkCount = bookmarkCount
        self.title = title
        self.description = description
        self.isBookmarked = isBookmarked
    }
    
    func equals(_ newsItem: NewsItem) -> Bool {
        return self.image == newsItem.image &&
            self.viewCount == newsItem.viewCount &&
            self.bookmarkCount == newsItem.bookmarkCount &&
            self.title == newsItem.title &&
            self.description == newsItem.description &&
            self.isBookmarked == newsItem.isBookmarked
    }
}
