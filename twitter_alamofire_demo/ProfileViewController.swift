//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Marissa Bush on 7/7/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {

    var user: User = User.current!
    
    var tweet: Tweet!
    
    @IBOutlet weak var profileHeaderImage: UIImageView!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var profileNameLabel: UILabel!
    
    @IBOutlet weak var profileUsernameLabel: UILabel!
    
    @IBOutlet weak var followersCountLabel: UILabel!
    
    @IBOutlet weak var followingCountLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     //       detailTweetLabel.text = tweet.text
     //       detailFavoriteCountLabel.text = String(tweet.favoriteCount)
   //         detailRetweetCountLabel.text = String(tweet.retweetCount)
            profileNameLabel.text = user.name
            profileUsernameLabel.text = "@\(user.tweetUsername)"
            followersCountLabel.text = String(user.followers)
            followingCountLabel.text = String(user.following)
          //  profileHeaderImage.image = nil
            profileHeaderImage.af_setImage(withURL: URL(string: user.headerURL)!)
           // profileImage.image = nil
            profileImage.af_setImage(withURL: URL(string: user.imageURL)!)
            

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
