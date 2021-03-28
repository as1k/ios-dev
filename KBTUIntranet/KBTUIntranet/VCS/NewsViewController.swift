//
//  ViewController.swift
//  KBTUIntranet
//
//  Created by Асыланбек Нурмухамбет on 3/13/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    private var model = NewsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.getNewsListLength()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        model.getCell(tableView, indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let index = (tableView.indexPathForSelectedRow?.row)!
            destination.newsItemIndex = index
            destination.newsItem = model.news[index]
            destination.incrViewCountDelegate = self
        }
        else if let destination = segue.destination as? BookmarksViewController {
            destination.bookmarkDelegate = self
            destination.bookmarkedNews = model.news.filter { $0.isBookmarked == true }
        }
    }
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        
    }
}

extension NewsViewController: BookmarkDelegate, IncrViewDelegate {
    func removeFromBookmarks(item: NewsItem) {
        model.removeFromBookmarks(item)
        tableView.reloadData()
    }
    
    func incrViewCountByDelegate(index: Int) {
        model.incrementViewCount(index: index)
        tableView.reloadData()
    }
}
