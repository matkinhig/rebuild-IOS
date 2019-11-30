//
//  FirstCurrencyCell.swift
//  Rebuild-IOSVB
//
//  Created by Mắt Kính IG on 11/29/19.
//  Copyright © 2019 Mắt Kính IG. All rights reserved.
//

import UIKit

class FirstCurrencyCell: UITableViewCell {

    @IBOutlet weak var btnCal: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnCal.layer.cornerRadius = 2
        btnCal.layer.borderColor = UIColor.gray.cgColor
        btnCal.layer.borderWidth = 0.3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
