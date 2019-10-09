//
//  WebViewController.swift
//  Grove Support
//
//  Created by Jon on 6/15/19.
//  Copyright © 2019 Jon. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController, UINavigationBarDelegate, UIBarPositioningDelegate, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    var urlWebsite:String?
    var topTitle:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(urlWebsite ?? "nope")

        NavBar.topItem?.title = topTitle
        webView.load(URLRequest(url: URL(string: urlWebsite ?? "ok")!))
        
        NavBar.delegate = self
        
       
}
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("WebView content loaded.")
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
    @IBOutlet weak var NavBar: UINavigationBar!
    @IBAction func done(_ sender: Any) {
        dismiss(animated: true)
    }

}
