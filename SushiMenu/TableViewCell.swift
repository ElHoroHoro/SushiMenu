//
//  TableViewCell.swift
//  SushiMenu
//
//  Created by Hiroki Son on 2019/11/27.
//  Copyright © 2019 19cm0117. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLabel(label: String) {
        self.label.text = label
    }
    
}
