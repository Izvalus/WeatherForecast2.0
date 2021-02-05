//
//  DetailedInformationView.swift
//  WeatherForecast2.0
//
//  Created by Роман Мироненко on 30.01.2021.
//

import UIKit
import SnapKit

extension DetailedInformationViewController {
    class DetailedInformationView: UIView {
        let tableView = setup(UITableView()) {
            $0.tableFooterView = UIView()
            $0.register(DetailedInformationViewController.TableViewCell.self, forCellReuseIdentifier: "Cell")
        }
        
        let titleLabel = setup(UILabel()) { _ in
            
        }
        
        init() {
            super.init(frame: .zero)
            addSubview(tableView)
            setupConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setupConstraints() {
//            titleLabel.snp.makeConstraints
            tableView.snp.makeConstraints { make in make.edges.equalTo(safeAreaLayoutGuide) }
        }
        
        
    }
}
