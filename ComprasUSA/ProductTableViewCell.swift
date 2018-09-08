//
//  ProductTableViewCell.swift
//  ComprasUSA
//
//  Created by Leandro Yukio on 07/09/2018.
//  Copyright © 2018 Leandro Takahashi e Daniel Silva Santos. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var tfProductValue: UILabel!
    @IBOutlet weak var ivProductImage: UIImageView!
    @IBOutlet weak var lbCellProductName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
