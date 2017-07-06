//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/17/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation
import AlamofireImage

class User {
    
    var name: String
    var tweetUsername: String
    var imageURL: String
    
    private static var _current: User?
    
    var userDictionary: [String: Any]?
    static var current: User? {
        get {
            if _current == nil {
                let defaults = UserDefaults.standard
                if let userData = defaults.data(forKey: "currentUserData") {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! [String: Any]
                    _current = User(dictionary: dictionary)
                }
            }
            return _current
        }
        set (user) {
            _current = user
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.userDictionary!, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.removeObject(forKey: "currentUserData")
            }
        }
    }
    
    
    
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as! String
        tweetUsername = dictionary["screen_name"] as! String
        imageURL = dictionary["profile_image_url_https"] as! String
        self.userDictionary = dictionary
    }
    
}
