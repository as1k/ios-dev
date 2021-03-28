//
//  OnlineRegViewController.swift
//  KBTUIntranet
//
//  Created by Асыланбек Нурмухамбет on 3/20/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit
import WebKit

class OnlineRegViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.uiDelegate = self
        webView.load(URLRequest(url: URL(string: "https://kbtu.studyspace.kz/login#sign-in")!))
    }
}
