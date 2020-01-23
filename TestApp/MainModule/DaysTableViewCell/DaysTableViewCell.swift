//
//  DaysTableViewCell.swift
//  MyWeather
//
//  Created by Vitalii Sydorskyi on 1/20/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import UIKit

class DaysTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func config(data: DaysDataType) {
        
        dayLabel.text = data.0
        temperatureLabel.text = data.1
        weatherIcon.image = data.2
    }
    
}
