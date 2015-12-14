//
//  MatchTableViewCell.swift
//  Myfoot
//
//  Created by Lucas Blanqui on 07/12/2015.
//  Copyright © 2015 Lucas Blanqui. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ScoreLocal: UILabel!
    @IBOutlet weak var NameLocal: UILabel!
    @IBOutlet weak var ScoreVisitor: UILabel!
    @IBOutlet weak var NameVisitor: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
