//
//  MainViewController+Table.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/22/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Table data source, delegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        
        daysTableView.register(DaysTableViewCell.nib(), forCellReuseIdentifier: DaysTableViewCell.reuseIdentifier())
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5 //We have only 5 days prediction from API
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: DaysTableViewCell.reuseIdentifier(), for: indexPath) as? DaysTableViewCell {
            
            if let data = DataManager.prepareData(data: presenter.model, index: indexPath.row, options: [.max,.min,.day,.icon]) {
                
                let infoToPresent = presenter.prepareDaysWeather(data: data)
                
                cell.config(data: infoToPresent)
            }
            
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let data = DataManager.prepareData(data: presenter.model, index: indexPath.row) {
            
            presenter.weatherInfoData = data
        }
    }
}
