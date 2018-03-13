//
//  DataFormat.swift
//  NewsFeeds
//
//  Created by shreyas on 12/16/17.
//  Copyright © 2017 shreyas. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class DataFormat {
    
    let title : String
    let description : String
    let image : String
    let source_url : String
    let source_name : String
    let metadata : String
    let created_date : String
    let id : Int
    let notify : Bool
   
    
    init(titleText : String, descriptionText : String, imageUrl : String, newsSourceUrl : String, newsSourceName : String, metadataText : String, created_dateText : String, idText : Int, notifyText : Bool) {
        title = titleText
        description = descriptionText
        image = imageUrl
        source_url = newsSourceUrl
        source_name = newsSourceName
        metadata = metadataText
        created_date = created_dateText
        id = idText
        notify = notifyText
    }
}


    

