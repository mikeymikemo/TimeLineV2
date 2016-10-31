//
//  PostTableViewCell.swift
//  TimelineV2
//
//  Created by Michael Montoya on 10/31/16.
//  Copyright © 2016 Michael Montoya. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    var post: Post? {
        
        didSet {
            
            updateWithPost()
        }
        
    }
    
    @IBOutlet weak var postImage: UIImageView!
    
//Create a PostTableViewCell class, add and implement an updateWithPost to the PostTableViewCell to update the image view with the Post's photo.
    
    func updateWithPost() {
        guard let photo = post?.photo else { return }
        postImage.image = photo
        
    }

}
