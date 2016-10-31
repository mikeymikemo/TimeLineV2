//
//  PostDetailTableViewController.swift
//  TimelineV2
//
//  Created by Michael Montoya on 10/31/16.
//  Copyright © 2016 Michael Montoya. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    
    var post: Post?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var followPostButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40
        
        updateViews()
    }
    
    @IBAction func commentButtonTapped(_ sender: Any) {
        
        presentCommentAlertController()
        
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
    }

    @IBAction func followButtonTapped(_ sender: Any) {
    }
    
    private func updateViews() {
        guard let post = post, isViewLoaded else { return }
        
        imageView.image = post.photo
        tableView.reloadData()
    }
    
    func presentCommentAlertController() {
        
        let alertController = UIAlertController(title: "Add Comment", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            
            textField.placeholder = "Nice shot!"
        }
        
        let addCommentAction = UIAlertAction(title: "Add Comment", style: .default) { (action) in
            
            guard let commentText = alertController.textFields?.first?.text,
                let post = self.post else { return }
            
            PostController.shared.addCommentToPost(text: commentText, post: post)
            self.updateViews()
        }
        alertController.addAction(addCommentAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }

    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // returning the amount of comments. If there aren't any then it will be 0 rows.
        return post?.comments.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        
        guard let post = post else { return cell }
        let comment = post.comments[indexPath.row]
        
        cell.textLabel?.text = comment.text
        //cell.detailTextLabel?.text = post.timestamp
        
        // Configure the cell...
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }
}
