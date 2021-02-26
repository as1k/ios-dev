//
//  InfoVC.swift
//  BrowserApp
//
//  Created by Асыланбек Нурмухамбет on 2/25/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit
import WebKit

class InfoVC: UIViewController, WKUIDelegate {
    
    let defaultTitle = "Youtube"
    let defaultLink = "https://www.youtube.com"

    @IBOutlet weak var browserWebView: WKWebView!
    var link: String?
    var id = 0
    var openedWebsite = totalWebsites[LIST_TABLE_VIEW_ID][0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if navigationItem.title == nil {
            navigationItem.title = defaultTitle
        }
        if totalWebsites[FAVORITES_TABLE_VIEW_ID].contains(where: { element in
            element.title == openedWebsite.title && element.link == openedWebsite.link
        }) {
            navigationController?.navigationBar.barTintColor = UIColor.yellow
        } else {
            navigationController?.navigationBar.barTintColor = UIColor.gray
        }
        
        browserWebView.load(URLRequest(url: URL(string: link ?? defaultLink)!))
        
        let tripleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tripleTap))
        tripleTapRecognizer.numberOfTapsRequired = 3
        self.browserWebView.addGestureRecognizer(tripleTapRecognizer)
        
    }
    
    @objc func tripleTap() {
        NSLog("Triple tapped")
        
        if !totalWebsites[FAVORITES_TABLE_VIEW_ID].contains { element in
            element.title == openedWebsite.title && element.link == openedWebsite.link
            }
        {
            totalWebsites[FAVORITES_TABLE_VIEW_ID].append(openedWebsite)
            navigationController?.navigationBar.barTintColor = .yellow
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: MASTER_UPDATED), object: nil)
        } else {
            NSLog(String(totalWebsites[FAVORITES_TABLE_VIEW_ID].count))
            let index = totalWebsites[FAVORITES_TABLE_VIEW_ID].firstIndex { element in
                element.title == openedWebsite.title && element.link == openedWebsite.link
            }
            if let id = index {
                NSLog(String(id))
                totalWebsites[FAVORITES_TABLE_VIEW_ID].remove(at: id)
            }
            navigationController?.navigationBar.barTintColor = .gray
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: MASTER_UPDATED), object: nil)
        }
    }
}
