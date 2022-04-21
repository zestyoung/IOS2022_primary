//
//  TableViewCellB.swift
//  2018051001郑煜test7
//
//  Created by 郑煜 on 2022/3/22.
//

import UIKit

class TableViewCellB: UITableViewCell {
    
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var l3: UILabel!
    @IBOutlet weak var l4: UILabel!
    @IBOutlet weak var l5: UILabel!
    @IBOutlet weak var l6: UILabel!
    @IBOutlet weak var date1: UILabel!
    
    @IBOutlet weak var iv1: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected{
            self.contentView.backgroundColor = UIColor.white
        }
        else{
            self.contentView.backgroundColor = UIColor.red
        }
        // Configure the view for the selected state
    }

}
