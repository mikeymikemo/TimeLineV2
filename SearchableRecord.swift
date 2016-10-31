//
//  SearchableRecord.swift
//  TimelineV2
//
//  Created by Michael Montoya on 10/31/16.
//  Copyright © 2016 Michael Montoya. All rights reserved.
//

import Foundation

protocol SearchableRecord {

    func matchesSearchTerm(searchTermParameter: String) -> Bool

}

//Define a SearchableRecord protocol with a required matchesSearchTerm function that takes a searchTerm parameter as a String and returns a Bool
