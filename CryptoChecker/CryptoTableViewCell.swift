//
//  CryptoTableViewCell.swift
//  CryptoChecker
//
//  Created by quantagonista on 2/7/18.
//  Copyright © 2018 quantadev. All rights reserved.
//

import UIKit

class CryptoTableViewCell: UITableViewCell, UINavigationControllerDelegate{
    //MARK:Properties
    var cInstance: Currency!
    @IBOutlet weak var cRank: UILabel!
    @IBOutlet weak var cName: UILabel!
    @IBOutlet weak var cPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

}
