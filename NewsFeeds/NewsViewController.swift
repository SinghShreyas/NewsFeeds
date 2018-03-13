//
//  NewsViewController.swift
//  NewsFeeds
//
//  Created by shreyas on 12/6/17.
//  Copyright © 2017 shreyas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NewsViewController: UIViewController {

    @IBOutlet weak var imageLoadFromJson: UIImageView!
    
    @IBOutlet weak var headingFromJson: UITextField!
    
    @IBOutlet weak var newsSummaryFromJson: UITextView!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var arrRes = [[String:AnyObject]]()
    
   // var newsImages: [String] = ["news1", "news2", "news3", "news4", "news5"]
    
    var newsImages = [String]()
    
  //  var newsHeadings: [String] = ["Breakingnews1", "Breakingnews2", "Breakingnews3", "Breakingnews4", "Breakingnews5"]
    
    var newsHeadings = [String]()
    
  //  var newsSummary: [String] = ["ThisIsNews1", "ThisIsnews2", "ThisIsnews3", "ThisIsnews4", "ThisIsnews5" ]
    
    var newsSummary: [String] = [String]()
    
    var newsCount: Int = -1
    
    let apiManager = APIManager()
    
    let data = DataFromAPI()
    
    var title1 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NewsAPI()
        
        sideMenus()

        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
      
    }

  @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
    
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            
                switch swipeGesture.direction {
            
                    case UISwipeGestureRecognizerDirection.up:
                        print("Swiped Up")
                        if newsCount < newsHeadings.count - 1 {
                            newsCount = newsCount + 1
                            setNewNews()
                        }
                        if newsCount >= newsHeadings.count - 1 {
                            ProgressHUD.showSuccess("End of News!")
                        }
                    
                    case UISwipeGestureRecognizerDirection.down:
                        print("Swiped down")
                        if newsCount > 0 {
                            newsCount = newsCount - 1
                            setNewNews()
                        }
                       if newsCount == 0 {
                            ProgressHUD.showSuccess("End of News!")
                        }
                    
//            case UISwipeGestureRecognizerDirection.left:
//                print("Swiped left")
//            case UISwipeGestureRecognizerDirection.up:
//                print("Swiped up")
                    default:
                        break
                }
            }
        }
    
   
    // Function to set New News on User Interface.
    func setNewNews() {
        if let url = NSURL(string: newsImages[newsCount]) {
            if let data = NSData(contentsOf: url as URL) {
                imageLoadFromJson.image = UIImage(data: data as Data)
            }
        }
       // imageLoadFromJson.image = UIImage(named: newsImages[newsCount])
        headingFromJson.text  = newsHeadings[newsCount]
        newsSummaryFromJson.text = newsSummary[newsCount]
    }
    
 
    // Function to set HeadingText
    func setHeadingAndSummaryText(){
        var data = self.arrRes[1]
        self.headingFromJson.text = data["title"] as? String
        self.newsSummaryFromJson.text = data["description"] as? String
        let url = URL(string:"https://avatars0.githubusercontent.com/u/6194272")
        let dict = try? Data(contentsOf: url!)
        let image: UIImage = UIImage(data: dict!)!
        self.imageLoadFromJson.image = image
    }
  
    
//    func NewsAPI(){
//
//        let url = "https://mastleadership.com/api/token-auth"
//        //Get token logic
//        let token = ""
//        let headers = ["Authorization": "token \(token)"]
//        let params = ["email": "kishor@kishor.com", "password":"abcd"] //This goes in the body of the request
//        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
//            if let value = response.result.value {
//                print(value)
//            }
//
//}
//}
    
    func NewsAPI(){
        Alamofire.request("https://mastleadership.com/api/news/?feed_id=-1",
            headers: ["Authorization": "token 4f027f2fcb318180e067da8fc9fea1666bb44021"]
            )
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching tags: \(String(describing: response.result.error))")
                  //  completion([String]())
                    return
                }

                guard let responseJSON = response.result.value as? [String: Any] else {
                    print("Invalid tag information received from the service")
                    //completion([String]())

                    return
                }

               // print(responseJSON)

                let json = JSON(responseJSON)
                for item in json["feeds"].arrayValue {
                     //print(item["title"].stringValue)
                    self.newsHeadings.append(item["title"].stringValue)
                    self.newsSummary.append(item["description"].stringValue)
                    self.newsImages.append(item["image"].stringValue)
                }


        }
    }
    
    func sideMenus() {
        if revealViewController() != nil {
            
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }
}

