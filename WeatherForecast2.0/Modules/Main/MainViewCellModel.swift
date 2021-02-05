//
//  MainViewCellModel.swift
//  WeatherForecast2.0
//
//  Created by Роман Мироненко on 05.02.2021.
//

import Foundation

extension MainViewController {
    struct CellModel: Hashable {
        static func == (lhs: MainViewController.CellModel, rhs: MainViewController.CellModel) -> Bool {
            lhs.cityName == rhs.cityName
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(cityName)
        }
        
        let cityName: String
        let weatherCondition: String
        let temp: Float
        let detailed: () -> Void
    }
}
