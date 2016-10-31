//
//  Comment.swift
//  TimelineV2
//
//  Created by Michael Montoya on 10/31/16.
//  Copyright © 2016 Michael Montoya. All rights reserved.
//

import UIKit


class Comment {
//Add a text property of type String, a timestamp NSDate property, and a post property of type Post.

var text: String
var timestamp: Date
var post: Post

//Add an initializer that accepts text, timestamp, and a post. Provide a default values for the timestamp argument, so it can be ommitted if desired.
    
    init(text: String, timestamp: Date = Date(), post: Post) {
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }

}

extension Comment: SearchableRecord {
    func matchesSearchTerm(searchTermParameter: String) -> Bool {
        return text.contains(searchTermParameter)
    }
}
