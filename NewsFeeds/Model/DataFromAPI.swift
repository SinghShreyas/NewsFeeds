//
//  DataFromAPI.swift
//  NewsFeeds
//
//  Created by shreyas on 12/16/17.
//  Copyright © 2017 shreyas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataFromAPI {
    
    var list = [DataFormat]()
    
    init() {
        // Creating a quiz item and appending it to the list
        // let item = Question(text: "Valentine\'s day is banned in Saudi Arabia.", correctAnswer: true)
        
        // Add the Question to the list of questions
        // list.append(item)
        
        // skipping one step and just creating the quiz item inside the append function
        Alamofire.request(
            "https://mastleadership.com/api/news/?feed_id=-1",
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
                    //  completion([String]())
                    
                    return
                }
                
                
                
                let json = JSON(responseJSON)
//                let count = json["feeds"].count
//                print("The count of json is  data\(count) ")
                
                for item in json["feeds"].arrayValue {
                    //print(item["title"].stringValue)
                   
//                     self.list.append(DataFormat(titleText : item["title"].stringValue, descriptionText : item["description"].stringValue, imageUrl : "json", newsSourceUrl : "json", newsSourceName : "json", metadataText : "json", created_dateText : "json", idText : 88, notifyText : false))
//                }
//                let count = json["feeds"].count
//                for var i in 0..<count {
               
                }
            }
    }
    }

