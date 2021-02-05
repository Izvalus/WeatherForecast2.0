//
//  DetailedInformationView.swift
//  WeatherForecast2.0
//
//  Created by Роман Мироненко on 30.01.2021.
//

import UIKit

class DetailedInformationViewController: UIViewController {
    
    lazy var customView = DetailedInformationView()
    
    let constituents: TemplateWeather
    
    let measurementFormatter = MeasurementFormatter()
    
    var detailedList = [Detailed]()
    
    init(constituents: TemplateWeather) {
        self.constituents = constituents
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
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        
        navigationItem.title = constituents.geoObject.locality.name
        
        detailedList.append(Detailed(name: "Название часового пояса", value: constituents.info.tzinfo.name))
        detailedList.append(Detailed(name: "Дата прогноза", value: constituents.forecasts[0].date))
        detailedList.append(Detailed(name: "Температура", value: formated(value: constituents.fact.temp)))
        detailedList.append(Detailed(name: "Ощущаемая температура", value: formated(value: constituents.fact.feelsLike)))
        detailedList.append(Detailed(name: "Время восхода cолнца", value: constituents.forecasts[0].sunrise))
        detailedList.append(Detailed(name: "Время заката cолнца", value: constituents.forecasts[0].sunset))
    }
    
    func formated(value: Float) -> String {
        let measurement = Measurement(value: Double(value), unit: UnitTemperature.celsius)
        return measurementFormatter.string(from: measurement)
    }
    
    
}

extension DetailedInformationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        detailedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailedInformationViewController.TableViewCell
        cell.nameLabel.text = detailedList[indexPath.row].name
        cell.infoLabel.text = detailedList[indexPath.row].value
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    
}

extension DetailedInformationViewController {
    struct Detailed {
        let name: String
        let value: String
    }
}
