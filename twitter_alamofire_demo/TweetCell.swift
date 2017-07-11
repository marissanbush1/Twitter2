//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetUsername: UILabel!
    @IBOutlet weak var tweetName: UILabel!
    @IBOutlet weak var tweetProfilePic: UIImageView!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var retweetOutlet: UIButton!
    @IBOutlet weak var favoriteOutlet: UIButton!
    
    @IBOutlet weak var favoriteCountLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    
    
    var tweet: Tweet! {
        didSet {
            
            reloadData(with: tweet)
        }
    }
    
    func reloadData(with tweet: Tweet){
        tweetTextLabel.text = tweet.text
        favoriteCountLabel.text = String(tweet.favoriteCount)
        retweetCountLabel.text = String(tweet.retweetCount)
        tweetName.text = tweet.user.name
        tweetUsername.text = "@\(tweet.user.tweetUsername)"
        tweetProfilePic.image = nil
        tweetProfilePic.af_setImage(withURL: URL(string: tweet.user.imageURL)!)
        
        // update cell selection
        if tweet.favorited{
            favoriteOutlet.isSelected = true
            
        } else{
            favoriteOutlet.isSelected = false
        }
        
        
        if tweet.retweeted{
            retweetOutlet.isSelected = true
            
        } else{
            retweetOutlet.isSelected = false
        }
        
        if (tweet.retweetCount == 0){
            retweetCountLabel.text = ""
        }
        if (tweet.favoriteCount == 0){
            favoriteCountLabel.text = ""
        }
        
        
    }
    
    func didFavorite(_ tweet: Tweet) {
        tweet.favorited = true
        tweet.favoriteCount = tweet.favoriteCount + 1
        
        reloadData(with: tweet)
        
        APIManager.shared.favorite(tweet, completion: { (tweet, error) in
            if let error = error {
                print("Error favoriting: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successful favorite: \(tweet.text)")
            }
        })
    }
    
    //    func didRetweet(_tweet: Tweet){
    //        reloadData(with: tweet)
    //        tweet.retweeted = true
    //        tweet.retweetCount = tweet.retweetCount + 1
    //
    //        reloadData(with: tweet)
    //
    //        APIManager.shared.retweet(with: tweet, completion: { (tweet, error) in
    //            if let error = error {
    //                print("Error retweeting: \(error.localizedDescription)")
    //            } else if let tweet = tweet {
    //                print("Successful retweet: \(tweet.text)")
    //            }
    //        })
    //    }
    
    func didUnfavorite(_ tweet: Tweet) {
        tweet.favorited = false
        tweet.favoriteCount = tweet.favoriteCount - 1
        
        reloadData(with: tweet)
        
        APIManager.shared.unfavorite(tweet, completion: { (tweet, error) in
            if let error = error {
                print("Error unfavoriting: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successful un-favorite: \(tweet.text)")
            }
        })
    }
    
    //    func didUnRetweet(_ tweet: Tweet) {
    //        tweet.retweeted = false
    //        tweet.retweetCount = tweet.retweetCount - 1
    //        reloadData(with: tweet)
    //
    //        APIManager.shared.didUnRetweet(with: tweet, completion: { (tweet, error) in
    //            if let error = error {
    //                print("Error unfavoriting: \(error.localizedDescription)")
    //            } else if let tweet = tweet {
    //                print("Successful un-favorite: \(tweet.text)")
    //            }
    //        })
    //
    //    }
    
    
    @IBAction func favoriteButton(_ sender: UIButton) {
        
        if  favoriteOutlet.isSelected{
            if let ogTweet = tweet.retweetedStatus {
                didUnfavorite(ogTweet)
            }else {
                didUnfavorite(tweet)
            }
        } else {
            if let ogTweet = tweet.retweetedStatus {
                didFavorite(ogTweet)
            } else {
                didFavorite(tweet)
            }
        }
    }
    
    
    
    @IBAction func retweetButton(_ sender: UIButton) {
        if tweet.retweeted  {
            tweet.retweeted = false
            tweet.retweetCount -= 1
            reloadData(with: tweet)
            
            APIManager.shared.didUnRetweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let tweet = self.tweet {
                    self.tweet = tweet
                    print("sucessful un-retweet")
                } else if let error = error {
                    print("Error un-retweeting: " + error.localizedDescription)
                }
            }
        } else  {
            tweet.retweeted = true
            tweet.retweetCount += 1
            reloadData(with: tweet)
            
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let tweet = self.tweet {
                    self.tweet = tweet
                    print("success retweet!")
                } else if let error = error {
                    print("Error retweeting: " + error.localizedDescription)
                }
            }
        }
    }
    
    func didTapUserProfile(_ sender: UITapGestureRecognizer) {
        // TODO: Call method on delegate
            }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let profileTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTapUserProfile(_:)))

        tweetProfilePic.addGestureRecognizer(profileTapGestureRecognizer)
        tweetProfilePic.isUserInteractionEnabled = true

        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
