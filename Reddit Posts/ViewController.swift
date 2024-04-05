//
//  ViewController.swift
//  Reddit Posts
//
//  Created by Omar Leal on 4/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    var allRedditPost: [RedditPostData] = []

    @IBOutlet weak var postTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        postTableView.delegate = self
        postTableView.dataSource = self
        postTableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.indentifier)
        
        fetchAllRedditPosts { (result, error)  in
            if let alldata = result {
                self.allRedditPost = alldata
                self.postTableView.reloadData()
            }
            
        }
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allRedditPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.indentifier, for: indexPath) as! TableViewCell
        
        let postCellData = allRedditPost[indexPath.row]
        customCell.title.text = postCellData.title
        customCell.author.text = postCellData.author
        customCell.comments.text = String(postCellData.num_comments)
        //customCell.customImage.image = UIImage(data: postCellData.thumbnailURL)
        
        if let thumbnailURL = postCellData.thumbnailURL {
            customCell.customImage.image = UIImage(systemName:  "placeholder")
                } else {
                    // Placeholder image if no thumbnail
                    customCell.customImage.image = UIImage(named: "placeholder")
                }
        return customCell
    }
    
    
}

