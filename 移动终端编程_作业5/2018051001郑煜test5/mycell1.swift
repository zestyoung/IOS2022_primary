//
//  mycell1.swift
//  2018051001郑煜test5
//
//  Created by 郑煜 on 2022/3/15.
//

import UIKit

class mycell1: UITableViewCell {
    
    @IBOutlet weak var iv1: UIImageView!
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var l3: UILabel!
    @IBOutlet weak var l4: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
