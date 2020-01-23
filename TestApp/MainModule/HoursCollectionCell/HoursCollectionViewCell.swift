//
//  HoursCollectionViewCell.swift
//  WeatherTestApp
//
//  Created by Vitalii Sydorskyi on 1/14/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import UIKit

class HoursCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(data: HoursDataType) {
        
        timeLabel.attributedText = data.0
        temperatureLabel.text = data.1
        weatherImageView.image = data.2
    }
}
