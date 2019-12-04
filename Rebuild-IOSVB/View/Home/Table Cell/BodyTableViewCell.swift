//
//  BodyTableViewCell.swift
//  Rebuild-IOSVB
//
//  Created by Mắt Kính IG on 12/2/19.
//  Copyright © 2019 Mắt Kính IG. All rights reserved.
//

import UIKit

class BodyTableViewCell: UITableViewCell {

    @IBOutlet weak var imgCard: UIImageView!
    @IBOutlet weak var lbTitleCard: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(item : CardModel) -> Void {
        imgCard.image = UIImage(named: item.imageCard)
        lbTitleCard.text = item.imageCard
    }

}
