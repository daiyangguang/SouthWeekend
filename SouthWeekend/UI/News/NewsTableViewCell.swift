//
//  NewsTableViewCell.swift
//  SouthWeekend
//
//  Created by 随随意 on 17/2/7.
//  Copyright © 2017年 suisuiyi. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    

    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
