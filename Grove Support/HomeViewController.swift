//
//  FirstViewController.swift
//  Grove Support
//
//  Created by Jon on 6/10/19.
//  Copyright © 2019 Jon. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var WebSite = String()
    var WebSiteTitle = String()
    
    var WebSiteServices = String()
    var WebSiteServicesTitle = String()
    
    var WebSiteSupport = String()
    var WebSiteSupportTitle = String()
    
    var WebSitePricing = String()
    var WebSitePricingTitle = String()
    
    var WebSiteEmail = String()
    var WebSiteEmailTitle = String()
    
    var WebSiteCTO = String()
    var WebSiteCTOTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if #available(iOS 15.0, *) {
                let appearance = UITabBarAppearance()
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        
        
        WebSite = "https://grovetech.co/clients/book/"
        WebSiteTitle = "Book Appointment"
        
        WebSiteServices = "https://support.grovetech.co/"
        WebSiteServicesTitle = "Open Ticket & Knowlegebase"
        
        WebSiteSupport = "https://grovetech.co/products/hosted/network/"
        WebSiteSupportTitle = "Network Support"
        
        WebSitePricing = "https://grovetech.co/pricing/"
        WebSitePricingTitle = "Get Pricing"
        
        WebSiteEmail = "https://grovetech.co/products/hosted/fleet/"
        WebSiteEmailTitle = "Heldesk Services"
        
        WebSiteCTO = "https://grovetech.co/products/ciso/"
        WebSiteCTOTitle = "Cybersecurity Services"
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "Footer", for: indexPath)
        return view
    }
    
    
    // MARK: Website Functions
    func goWebsite() {
        performSegue(withIdentifier: "WebViewFooter", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WebViewFooter"{
            let destination = segue.destination as? WebViewController
            destination!.urlWebsite = WebSite
            destination!.topTitle = WebSiteTitle
        } else if segue.identifier == "WebViewServices"{
            let destination = segue.destination as? WebViewController
            destination!.urlWebsite = WebSiteServices
            destination!.topTitle = WebSiteServicesTitle
        } else if segue.identifier == "WebViewSupport"{
            let destination = segue.destination as? WebViewController
            destination!.urlWebsite = WebSiteSupport
            destination!.topTitle = WebSiteSupportTitle
        } else if segue.identifier == "WebViewPricing"{
            let destination = segue.destination as? WebViewController
            destination!.urlWebsite = WebSitePricing
            destination!.topTitle = WebSitePricingTitle
        } else if segue.identifier == "WebViewEmail"{
            let destination = segue.destination as? WebViewController
            destination!.urlWebsite = WebSiteEmail
            destination!.topTitle = WebSiteEmailTitle
        } else if segue.identifier == "WebViewCTO"{
            let destination = segue.destination as? WebViewController
            destination!.urlWebsite = WebSiteCTO
            destination!.topTitle = WebSiteCTOTitle
        }
    }
    
    func BCUrlConstructor (intentId: String, groupId: String, bodyParam: String) -> URL {
    let bizId = "5c6b48ae-2c40-4014-8fe5-3d0d371fdee3" // Sets the Business ID
     // Construct Business Chat URL using business ID, intent ID, group ID, and preset body text
    let url : NSString = "https://bcrw.apple.com/sms:open?service=iMessage&recipient=urn:biz:\(bizId)&biz-intent-id=\(intentId)&bizgroup-id=\(groupId)&body=\(bodyParam)" as NSString
    let urlString : NSString = url.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)! as NSString
    let bcUrl : NSURL = NSURL(string: urlString as String)!
    return bcUrl as URL
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        // print("You Pressed the Footer Button!")
        //goWebsite()
        
        let url = BCUrlConstructor(intentId: "Grove", groupId: "Mac Support", bodyParam: "Hello, I am interested in support services")
         // Launch Business Chat
        UIApplication.shared.open(url)
    }
    
    let reuseIdentifier = "Cell" // also enter this string as the cell identifier in the storyboard
    var items = ["1", "2", "3", "4", "5", "6"]
    
    var recipePhotos: [UIImage] = [
        UIImage(named: "Phone.png")!,
        UIImage(named: "bag-and-hands.jpg")!,
        UIImage(named: "network.jpg")!,
        UIImage(named: "info.jpg")!,
        UIImage(named: "Message.png")!,
        UIImage(named: "ES_ITstrategy.png")!
    ];
    var iconLabels = ["Call Us", "Open A Ticket", "Network Support", "Get Pricing", "Heldesk Services", "Cybersecurity"];
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        Cell.myLabel.text = self.iconLabels[indexPath.item]
        Cell.myPic.image = self.recipePhotos[indexPath.item]
        Cell.backgroundColor = UIColor.white // make cell more visible in our example project
        Cell.layer.masksToBounds = true;
        Cell.layer.cornerRadius = 4;

        return Cell
    }
    
    func placecall() {
        
        let phone_number = "18622518712"
        
        if let url = URL(string: "tel://\(phone_number)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        
    }
    
    // MARK: - UICollectionViewDelegate protocol
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")

        if indexPath.item == 0 {
             placecall()
        } else if indexPath.item == 1 {
            performSegue(withIdentifier: "WebViewServices", sender: self)
        } else if indexPath.item == 2 {
            performSegue(withIdentifier: "WebViewSupport", sender: self)
        } else if indexPath.item == 3 {
            performSegue(withIdentifier: "WebViewPricing", sender: self)
        } else if indexPath.item == 4 {
            performSegue(withIdentifier: "WebViewEmail", sender: self)
        } else if indexPath.item == 5 {
            performSegue(withIdentifier: "WebViewCTO", sender: self)
        } else {
            performSegue(withIdentifier: "WebViewFooter", sender: self)
        }

        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellsAcross: CGFloat = 2
        let spaceBetweenCells: CGFloat = 10
        let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
        
        return CGSize(width: (dim - 10), height: (dim - 14))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }

    


}


    
class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myPic: UIImageView!
}
