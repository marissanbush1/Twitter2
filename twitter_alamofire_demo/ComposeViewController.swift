//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Marissa Bush on 7/6/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit

protocol ComposeViewControllerDelegate: class {
    func did(post: Tweet)
}

class ComposeViewController: UIViewController {

    weak var delegate: ComposeViewControllerDelegate?

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tweetTextView: UITextView!
    
    @IBAction func didTapCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func didTapPost(_ sender: Any) {
        APIManager.shared.composeTweet(with: tweetTextView.text) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
                self.dismiss(animated: true, completion: nil)

            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // let profileImageURL = URL(string: (User.current?.imageURL)!)
        // profileImage.af_setImage(withURL: profileImageURL!)
        
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
