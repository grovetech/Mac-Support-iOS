//
//  TopBarViewController.swift
//  Grove Support
//
//  Created by Jon on 6/14/19.
//  Copyright © 2019 Jon. All rights reserved.
//

import Foundation
import UIKit

class TopBarViewController: UIViewController {
    
    var WebSite = String()
    var WebSiteTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.translatesAutoresizingMaskIntoConstraints = true
        WebSite = "https://meetings.hubspot.com/jacksegar/default-meeting-link"
        WebSiteTitle = "Book Appointment"
    }
    
    func placecall() {
        
        let phone_number = "18002027400"
        
        if let url = URL(string: "tel://\(phone_number)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        
    }
    
    // MARK: Website Functions
    func goWebsite() {

        performSegue(withIdentifier: "WebView", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WebView"{
            let destination = segue.destination as? WebViewController
            destination!.urlWebsite = WebSite
            destination!.topTitle = WebSiteTitle
        }
    }
    
    @IBAction func makeApt(_ sender: Any) {
        goWebsite()
    }
    
    @IBAction func makeCall(_ sender: Any) {
        placecall()
    }
    
    
}


