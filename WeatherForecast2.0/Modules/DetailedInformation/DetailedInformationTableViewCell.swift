//
//  DetailedInformationTableViewCell.swift
//  WeatherForecast2.0
//
//  Created by Роман Мироненко on 31.01.2021.
//

import UIKit
import SnapKit

extension DetailedInformationViewController {
    class TableViewCell: UITableViewCell {

        let nameLabel = setup(UILabel()) {
            $0.numberOfLines = 0
        }
        
        let infoLabel = setup(UILabel()) {
            $0.numberOfLines = 0
        }
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.addSubview(nameLabel)
            contentView.addSubview(infoLabel)
            setupConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setupConstraints() {
            nameLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(contentView.layoutMargins.left)
                $0.centerY.equalToSuperview()
            }
            
            infoLabel.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(contentView.layoutMargins.right)
                $0.centerY.equalToSuperview()
            }
        }
    }
}
