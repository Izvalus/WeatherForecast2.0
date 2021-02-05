//
//  WeatherCollectionViewCell.swift
//  WeatherForecast2.0
//
//  Created by Роман Мироненко on 25.01.2021.
//

import UIKit

extension MainCollectionViewCell {
    final class Weather: UICollectionViewCell {
        
        let nameLabel = setup(UILabel()) {
            $0.numberOfLines = 0
        }
        
        let weatherConditionLabel = setup(UILabel()) { _ in
            
        }
        
        let tempLabel = setup(UILabel()) { _ in
            
        }
        
        override init(frame: CGRect) {
            super.init(frame: .zero)
            contentView.addSubview(nameLabel)
            contentView.addSubview(weatherConditionLabel)
            contentView.addSubview(tempLabel)
            backgroundColor = .lightGray
            layer.cornerRadius = 10
            setupConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setupConstraints() {
            nameLabel.snp.makeConstraints {
                $0.leading.top.equalTo(contentView.layoutMargins.left)
                $0.trailing.equalToSuperview().inset(contentView.layoutMargins.right)
            }
            weatherConditionLabel.snp.makeConstraints {
                $0.top.equalTo(nameLabel.snp.bottom)
                $0.leading.equalTo(nameLabel)
            }
            tempLabel.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(contentView.layoutMargins.right)
                $0.centerY.equalToSuperview()
            }
        }
    }
}
