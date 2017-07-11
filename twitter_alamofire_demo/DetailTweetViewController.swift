//
//  DetailTweetViewController.swift
//  twitter_alamofire_demo
//
//  Created by Marissa Bush on 7/7/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DetailTweetViewController: UIViewController {
    
    @IBOutlet weak var detailProfileImage: UIImageView!
    
    @IBOutlet weak var detailNameLabel: UILabel!
    
    @IBOutlet weak var detailUsernameLabel: UILabel!
    
    @IBOutlet weak var detailTweetLabel: UILabel!
    
    @IBOutlet weak var detailRetweetCountLabel: UILabel!
    
    @IBOutlet weak var detailFavoriteCountLabel: UILabel!

    var tweet: Tweet!
    @IBAction func didTapRetweet(_ sender: Any) {
        
    }
    
    @IBAction func didTapFavorite(_ sender: Any){
        
    }
    
    
    
 /*   func reloadData(with tweet: Tweet){
        detailTweetLabel.text = tweet.text
        detailFavoriteCountLabel.text = String(tweet.favoriteCount)
        detailRetweetCountLabel.text = String(tweet.retweetCount)
        detailNameLabel.text = tweet.user.name
        detailUsernameLabel.text = "@\(tweet.user.tweetUsername)"
        detailProfileImage.image = nil
        detailProfileImage.af_setImage(withURL: URL(string: tweet.user.imageURL)!)
        
        // update cell selection
//        if tweet.favorited{
//            favoriteOutlet.isSelected = true
//            
//        } else{
//            favoriteOutlet.isSelected = false
//        }
//        
//        
//        if tweet.retweeted{
//            retweetOutlet.isSelected = true
//            
//        } else{
//            retweetOutlet.isSelected = false
//        }
        
        if (tweet.retweetCount == 0){
            detailRetweetCountLabel.text = ""
        }
        if (tweet.favoriteCount == 0){
            detailFavoriteCountLabel.text = ""
        }
        
        
    }

    */
    override func viewDidLoad() {
        super.viewDidLoad()

        if let tweet = tweet{
            detailTweetLabel.text = tweet.text
            detailFavoriteCountLabel.text = String(tweet.favoriteCount)
            detailRetweetCountLabel.text = String(tweet.retweetCount)
            detailNameLabel.text = tweet.user.name
            detailUsernameLabel.text = "@\(tweet.user.tweetUsername)"
            detailProfileImage.image = nil
            detailProfileImage.af_setImage(withURL: URL(string: tweet.user.imageURL)!)

        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
