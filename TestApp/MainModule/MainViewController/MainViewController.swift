//
//  MainViewController.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/22/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var daysTableView: UITableView!
    @IBOutlet weak var hoursCollectionView: UICollectionView!
    
    //Current weather outlets
    @IBOutlet weak var currentWeatherImageView: UIImageView!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentWindSpeedLabel: UILabel!
    @IBOutlet weak var currentDateLabel: UILabel!
    @IBOutlet weak var currentCityLabel: UILabel!
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.fetchData(lat: nil, lon: nil)
        
        setupCollectionView()
        setupTableView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadDataFromNotification), name: .DataReloaded, object: nil)
    }
    
    @objc func reloadDataFromNotification(_ notification: Notification) {
        
        if let data = notification.userInfo?["data"] as? ForecastWeatherModel {
            presenter.model = data
        }
    }
    
    @IBAction func didTappedSearchCity() {
        
        presenter.showSearchCityView()
    }
    
    @IBAction func didTappedMap() {
        
        presenter.showMap()
    }
}

extension MainViewController: MainViewControllerProtocol {
    
    //In
    func reloadView() {
        
        reloadTable()
        reloadCollection()
        updateUI()
    }
    
    func reloadTable() {
        
        daysTableView.reloadData()
    }
    
    func reloadCollection() {
        
        hoursCollectionView.reloadData()
    }
    
    func reloadCurrentWeather() {
        
        updateUI()
    }
    
    //Out
    func reloadWeatherWithCoords(lat: String, lon: String) {
        
        presenter.fetchData(lat: lat, lon: lon)
    }
    
}

