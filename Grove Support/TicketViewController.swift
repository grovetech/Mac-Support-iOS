//
//  TicketViewController.swift
//  Grove Support
//
//  Created by Jon on 6/15/19.
//  Copyright © 2019 Jon. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class TicketViewController: UIViewController, UINavigationBarDelegate, UIBarPositioningDelegate, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "reload", withExtension: "html")!
        webView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        webView.load(request)
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("WebView content loaded.")
    }
    
}
