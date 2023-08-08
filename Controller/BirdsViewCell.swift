//
//  BirdsViewCell.swift
//  Tiredy-Birdy
//
//  Created by Kobiraj on 8/9/21.
//

import UIKit

class BirdsViewCell: UITableViewCell {

    @IBOutlet weak var BirdsImage: UIImageView!
    @IBOutlet weak var BirdsName: UILabel!
    @IBOutlet weak var BirdsPetName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
