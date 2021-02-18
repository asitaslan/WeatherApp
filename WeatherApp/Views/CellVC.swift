//
//  CellVC.swift
//  WeatherApp
//
//  Created by Asit Aslan on 17.02.2021.
//  Copyright © 2021 Asit Aslan. All rights reserved.
//

import UIKit

class CellVC: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = 25.0
        cellView.clipsToBounds = true
        
        cellImageView.image = UIImage(named: "rainy")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
