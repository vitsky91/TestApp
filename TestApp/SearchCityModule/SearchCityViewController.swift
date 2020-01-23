//
//  SearchCityViewController.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/22/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Foundation
import UIKit

class SearchCityViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: SearchCityPresenterProtocol!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private var filteredCities = [CityModel]()
    
    private var isSearchBarEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getCitiesData()
        
        setupUI()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        
        searchBar.showsCancelButton = false
        dismiss(animated: true, completion: nil)
    }
    
    
    fileprivate func setupUI() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search city"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchController.searchBar.delegate = self
        searchController.searchBar.showsCancelButton = true
    }
    
}

extension SearchCityViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        
        filteredCities = DataManager.citiesArray.filter({ (model) -> Bool in
            return (model.city?.lowercased().contains(searchText.lowercased()) ?? false)
        })
        
        tableView.reloadData()
    }
}

extension SearchCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return isFiltering ? filteredCities.count : DataManager.citiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = isFiltering ? filteredCities[indexPath.row].city : DataManager.citiesArray[indexPath.row].city
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        let pickedCity = DataManager.citiesArray.filter({$0.city == cell?.textLabel?.text}).first
        
        if let lon = pickedCity?.lng, let lat = pickedCity?.lat {
            dismiss(animated: true, completion: {[weak self] in
                self?.presenter.networkService.getWeather(lon: lon, lat: lat, completion: {_ in})
            })
        }
    }
    
}

extension SearchCityViewController: SearchCityViewProtocol {
    
}
