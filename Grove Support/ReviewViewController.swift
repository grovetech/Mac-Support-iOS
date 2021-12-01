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

class ReviewViewController: UIViewController, UINavigationBarDelegate, UIBarPositioningDelegate, WKNavigationDelegate, WKUIDelegate {
    
   
    @IBOutlet var webView: WKWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.uiDelegate = self
        
        let url = Bundle.main.url(forResource: "reviews", withExtension: "html")!
        webView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        webView.load(request)
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("WebView content loaded.")
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
        return nil
    }
    
}
