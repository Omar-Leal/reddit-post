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
        postTableView.register(PostViewCell.nuib(), forCellReuseIdentifier: PostViewCell.identifier)
        
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
        let customCell = tableView.dequeueReusableCell(withIdentifier: PostViewCell.identifier, for: indexPath) as! PostViewCell
        
        let postCellData = allRedditPost[indexPath.row]
        customCell.customTitle.text = postCellData.title
        customCell.customImage.image = UIImage(systemName: "square.and.pencil.circle")
        
      return customCell
    }
    
    
}

