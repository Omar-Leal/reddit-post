//
//  Networking.swift
//  Reddit Posts
//
//  Created by Omar Leal on 4/5/24.
//
import Foundation
import Alamofire

struct RedditPostData: Codable {
let title: String
let author: String
let subreddit: String
}

struct EndpointApi {
  let data: RedditPostData
}

struct Collections {
  let response: [EndpointApi]
}

func fetchAllRedditPosts(completion: @escaping ([RedditPostData]?, Error?) -> Void) {
        let clientId = "fRSWlGSfkNwQni-QoKBgCw"
        let clientSecret = "H3RK9ombBeKko9l8XVA50l8b5MV73Q"
        let urlString = "https://www.reddit.com/top/.json"
 
        let credentialData = "\(clientId):\(clientSecret)".data(using: .utf8)!
        let base64Credentials = credentialData.base64EncodedString()
        let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)"]

       AF.request(urlString, headers: headers).responseJSON { response in
           switch response.result {
                 case .success(let value):
             do {
                   if let dataArray = value as? [String: Any],
                   let postDictionary = dataArray["data"] as? [String: Any],
                    let redditPosts = postDictionary["children"] as? [[String: Any]] {

                    let redditPostData: [RedditPostData] = redditPosts.compactMap { post in
                    guard let postData = post["data"] as? [String: Any] else { return nil }
                                        return RedditPostData(title: postData["title"] as? String ?? "",
                                        author: postData["author"] as? String ?? "",
                                        subreddit: postData["subreddit"] as? String ?? "")
                }
               completion(redditPostData, nil)
            } else {
                 completion(nil, nil) // You need to provide an error object here
             }
             } catch {
               completion(nil, error)
             }
            case .failure(let error):
                   completion(nil, error)
            }
             }
}

