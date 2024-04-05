//
//  PostViewCell.swift
//  Reddit Posts
//
//  Created by Omar Leal on 4/5/24.
//

import UIKit

class PostViewCell: UITableViewCell {

    @IBOutlet weak var customTitle: UILabel!
    @IBOutlet weak var customImage: UIImageView!
    static let identifier = "PostViewCell"
    static func nuib() -> UINib {
        return UINib(nibName: "PostViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
