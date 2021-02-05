//
//  ViewController.swift
//  WeatherForecast2.0
//
//  Created by Роман Мироненко on 25.01.2021.

import UIKit

class MainViewController: UIViewController {
    
    lazy var collectionDataSource = UICollectionViewDiffableDataSource<Int, CellModel>.init(collectionView: customView.collectionView) { (collectionView, indexPath, element) -> UICollectionViewCell? in
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as MainCollectionViewCell.Weather
        cell.nameLabel.text = element.cityName
        cell.weatherConditionLabel.text = ConditionLocalization(rawValue: element.weatherCondition)?.localization
        let measurement = Measurement(value: Double(element.temp), unit: UnitTemperature.celsius)
        cell.tempLabel.text = self.measurementFormatter.string(from: measurement)
        return cell
    }
    
    let mainViewModel: MainViewModel
    
    lazy var customView = View()
    
    let measurementFormatter = MeasurementFormatter()
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    init(mainViewModel: MainViewModel) {
        self.mainViewModel = mainViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Weather Forecast"
        
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = collectionDataSource
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        mainViewModel.load()
    }
    
    func reloadDataSource(cellModelList: [CellModel]){
        var diffableModelDataSource = NSDiffableDataSourceSnapshot<Int, MainViewController.CellModel>()
        diffableModelDataSource.appendSections([0])
        diffableModelDataSource.appendItems(cellModelList)
        collectionDataSource.apply(diffableModelDataSource, animatingDifferences: true)
    }
    
    func presentDetailViewController(model: TemplateWeather) {
        present(
            UINavigationController(
                rootViewController: DetailedInformationViewController(constituents: model)
            ),
            animated: true
        )
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionDataSource.itemIdentifier(for: indexPath)?.detailed()
    }
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        mainViewModel.search(queryString: searchController.searchBar.text)
    }
}
