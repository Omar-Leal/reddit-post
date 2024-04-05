//
//  TableViewCell.swift
//  Reddit Posts
//
//  Created by Omar Leal on 4/5/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var comments: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var customImage: UIImageView!
    static let indentifier = "TableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
