//
//  BookmarksViewController.swift
//  KBTUIntranet
//
//  Created by Асыланбек Нурмухамбет on 3/13/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class BookmarksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var bookmarkTableView: UITableView!
    var bookmarkDelegate: BookmarkDelegate?
    private var model = BookmarksModel()
    var bookmarkedNews: [NewsItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bookmarkTableView.reloadData()
        NSLog(String(model.getBookmarkedListLength(bookmarked: bookmarkedNews)))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.getBookmarkedListLength(bookmarked: bookmarkedNews)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        model.getModelCell(tableView, indexPath, bookmarked: bookmarkedNews)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            bookmarkDelegate?.removeFromBookmarks(item: bookmarkedNews[indexPath.row])
            bookmarkedNews.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
