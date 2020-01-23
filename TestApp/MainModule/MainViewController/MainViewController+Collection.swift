//
//  MainViewController+Collection.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/22/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController {
    
    func setupCollectionView() {
        
        hoursCollectionView.backgroundColor = UIColor.hexStringToUIColor(hex: Constants.HoursWeatherColor)
        
        hoursCollectionView.showsHorizontalScrollIndicator = false
        
        hoursCollectionView.register(HoursCollectionViewCell.nib(), forCellWithReuseIdentifier: HoursCollectionViewCell.reuseIdentifier())
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 100)
    }
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return DataManager.getAllWeatherOfDay(data: presenter.model, presenter.dayDescription)?.count ?? 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HoursCollectionViewCell.reuseIdentifier(), for: indexPath) as? HoursCollectionViewCell else {
            
            return UICollectionViewCell()
        }
        
        if let data = DataManager.getAllWeatherOfDay(data: presenter.model, presenter.dayDescription)?[indexPath.row] {
            
            let configInfo = presenter.prepareHoursWeather(data: data)
            
            cell.configure(data: configInfo)
        }
        
        return cell
        
    }
    
}
