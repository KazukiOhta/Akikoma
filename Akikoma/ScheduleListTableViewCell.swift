
//
//  ScheduleListTableViewCell.swift
//  Akikoma
//
//  Created by 太田 一毅 on 2019/05/10.
//  Copyright © 2019 太田 一毅. All rights reserved.
//

import UIKit

class ScheduleListTableViewCell: UITableViewCell {

    
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var periodLabel: UILabel!
    @IBOutlet var classNameLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
