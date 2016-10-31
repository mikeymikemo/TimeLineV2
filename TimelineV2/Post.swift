//
//  Post.swift
//  TimelineV2
//
//  Created by Michael Montoya on 10/31/16.
//  Copyright © 2016 Michael Montoya. All rights reserved.
//

import UIKit

class Post {

//Add a photoData property of type NSData?, a timestamp NSDate property, and a comments property of type [Comment].
    
    var photoData: Data?
    var timestamp: Date
    var comments: [Comment]
    
//Add a computed property, photo that returns a UIImage initialized using the data in photoData.
    
    var photo: UIImage? {
        
        guard let photoData = self.photoData else { return nil }
        return UIImage(data: photoData)
        
    }
    
//Add an initializer that accepts photoData, timestamp, and comments array. Provide default values for the timestamp and comments arguments, so they can be ommitted if desired.
    
    init(photoData: Data?, timestamp: Date = Date(), comments: [Comment] = []) {
        self.timestamp = timestamp
        self.photoData = photoData
        self.comments = comments
    }

}

extension Post: SearchableRecord {
    func matchesSearchTerm(searchTermParameter: String) -> Bool {
        let matchingComments = comments.filter { $0.matchesSearchTerm(searchTermParameter: searchTermParameter) }
        return !matchingComments.isEmpty
    }
}
