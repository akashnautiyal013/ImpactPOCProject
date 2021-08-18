//
//  LocationTableViewCell.swift
//  ImpactPOCProject
//
//  Created by Akash on 17/08/21.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    @IBOutlet weak var long: UILabel!
    
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var lat: UILabel!
    @IBOutlet weak var gpsAccuracy: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

