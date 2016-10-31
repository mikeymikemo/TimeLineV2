//
//  PostListTableViewController.swift
//  TimelineV2
//
//  Created by Michael Montoya on 10/31/16.
//  Copyright © 2016 Michael Montoya. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PostController.shared.posts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postListCell", for: indexPath) as? PostTableViewCell else { return PostTableViewCell() }
        
        // Configure the cell...
        
        let posts = PostController.shared.posts
        cell.post = posts[indexPath.row]
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "cellToDetail" {
            if let detailViewController = segue.destination as? PostDetailTableViewController,
                let selectedIndexPath = self.tableView.indexPathForSelectedRow {
                
                let posts = PostController.shared.posts
                detailViewController.post = posts[selectedIndexPath.row]
            }
        }
    }
}
