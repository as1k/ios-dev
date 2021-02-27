//
//  WebsiteModel.swift
//  BrowserApp
//
//  Created by Асыланбек Нурмухамбет on 2/26/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation

struct WebsiteModel {

    private var websites: [Website] = [
           Website(title: "YouTube", link: "https://www.youtube.com"),
           Website(title: "Facebook", link: "https://www.facebook.com"),
           Website(title: "Google", link: "https://www.google.com")
       ]
    private var favWebsites: [Website] = [Website]()
    private lazy var totalWebsites = [websites, favWebsites]
    
    mutating func getTotalWebsites() -> [[Website]]  {
        return totalWebsites
    }
    
    mutating func addWebsite(_ website: Website) {
        totalWebsites[LIST_TABLE_VIEW_ID].append(website)
    }
    
    mutating func addToFav(_ website: Website) {
        totalWebsites[FAVORITES_TABLE_VIEW_ID].append(website)
    }
    
    mutating func deleteFromFav(_ index: Int){
        totalWebsites[FAVORITES_TABLE_VIEW_ID].remove(at: index)
    }
}
