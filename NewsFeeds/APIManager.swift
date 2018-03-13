//
//  APIManager.swift
//  NewsFeeds
//
//  Created by shreyas on 12/16/17.
//  Copyright © 2017 shreyas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    
    func NewsAPI(){
        
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
                let count = json["feeds"].count
                print("The count of json is \(count) ")
              
//                for item in json["feeds"].arrayValue {
//                    print(item["title"].stringValue)
//                    //title.append(item["title"].stringValue)
//                }

        }
        
        
    }
    
    
    
}
