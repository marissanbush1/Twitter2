//
//  ProfileTweetsCell.swift
//  twitter_alamofire_demo
//
//  Created by Marissa Bush on 7/7/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit

protocol ProfileTweetsCellDelegate: class {
    func tweetCell(_ tweetCell: TweetCell, didTap user: User)

}
class ProfileTweetsCell: UITableViewCell {

    weak var delegate: ProfileTweetsCellDelegate?


    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
