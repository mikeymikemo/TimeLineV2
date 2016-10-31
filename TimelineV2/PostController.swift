//
//  PostController.swift
//  TimelineV2
//
//  Created by Michael Montoya on 10/31/16.
//  Copyright © 2016 Michael Montoya. All rights reserved.
//

import UIKit

    //Add a new PostController class file.
class PostController {
    
    //Add a sharedController singleton property.
    static let shared = PostController()
    
    //Add a posts property.
    var posts: [Post] = []
    
    //Add a createPost function that takes an image parameter as a UIImage and a caption as a String.
    
    func createPost(image: UIImage, caption: String) {
        //Implement the createPost function to initialize a Post with the image and a Comment with the caption text.
        guard let data = UIImageJPEGRepresentation(image, 0.8) else { return }
        
        let post = Post(photoData: data)
        let comment = Comment(text: caption, post: post)
        
        post.comments.append(comment)
        posts.append(post)
    }
    
    
//Add a addCommentToPost function that takes a text parameter as a String, and a Post parameter.
    
    func addCommentToPost(text: String, post: Post) {
        
        //Implement the addCommentToPost function to call the appropriate Comment initializer and adds the comment to the appropriate post.
        
        let comment = Comment(text: text, post: post)
        post.comments.append(comment)
        
    }
}
