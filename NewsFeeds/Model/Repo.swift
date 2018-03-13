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

class Repo {
    
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


//    required init(json: JSON) {
//        title = json["title"].stringValue
//        description = json["description"].stringValue
//        image = json["image"].stringValue
//        source_url = json["source_url"].stringValue
//        source_name = json["source_name"].stringValue
//        metadata = json["metadata"].stringValue
//        created_date = json["created_date"].stringValue
//        id = json["id"].intValue
//        notify = json["notify"].boolValue
//    }
//
//    class func getMyRepos(completionHandler: (Array<Repo>?, NSError?) -> Void)
//    {
//        let path = "https://api.github.com/user/repos"
//        Alamofire.request(path,  headers: ["Authorization": "token 4f027f2fcb318180e067da8fc9fea1666bb44021"])
//            .responseRepoArray { (request, response, repos, error) in
//                if let anError = error
//                {
//                    println(anError)
//                    // TODO: parse out errors more specifically
//                    completionHandler(nil, error)
//                    return
//                }
//                println(response)
//                println(request)
//                completionHandler(repos, nil)
//        }
//    }
//}
//
//extension Alamofire.Request {
//    class func repoArrayResponseSerializer() -> Serializer {
//        return { request, response, data in
//            if data == nil {
//                return (nil, nil)
//            }
//
//            var jsonError: NSError?
//            let jsonData:AnyObject? = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: &jsonError)
//            if jsonData == nil || jsonError != nil
//            {
//                return (nil, jsonError)
//            }
//            let json = JSON(jsonData!)
//            if json.error != nil || json == nil
//            {
//                return (nil, json.error)
//            }
//
//            var repos:Array = Array<Repo>()
//            for (key, jsonRepo) in json
//            {
//                println(key)
//                println(jsonRepo)
//                let repo = Repo(json: jsonRepo)
//                repos.append(repo)
//            }
//            return (repos, nil)
//        }
//    }
//
//    func responseRepoArray(completionHandler: (NSURLRequest, HTTPURLResponse?, Array<Repo>?, NSError?) -> Void) -> Self {
//        return response(serializer: Request.repoArrayResponseSerializer(), completionHandler: { (request, response, repos, error) in
//            completionHandler(request, response, repos as? Array<Repo>, error)
//        })
//    }
//}
//
//public protocol ResponseObjectSerializable {
//    init?(response: HTTPURLResponse, representation: AnyObject)
//}
//
//extension Request {
//    public func responseObject<T: ResponseObjectSerializable>(completionHandler: responseRepoArray<T, NSError> -> Void) -> Self {
//        let responseSerializer = ResponseSerializer<T, NSError> { request, response, data, error in
//            guard error == nil else { return .Failure(error!) }
//
//            let JSONResponseSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
//            let result = JSONResponseSerializer.serializeResponse(request, response, data, error)
//
//            switch result {
//            case .Success(let value):
//                if let
//                    response = response,
//                    let responseObject = T(response: response, representation: value)
//                {
//                    return .Success(responseObject)
//                } else {
//                    let failureReason = "JSON could not be serialized into response object: \(value)"
//                    let error = Error.errorWithCode(.JSONSerializationFailed, failureReason: failureReason)
//                    return .Failure(error)
//                }
//            case .Failure(let error):
//                return .Failure(error)
//            }
//        }
//
//        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
//    }
//}



