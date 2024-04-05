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
        <#code#>
    }
    
    
}

