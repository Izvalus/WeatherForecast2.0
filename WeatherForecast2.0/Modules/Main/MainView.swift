//
//  MainView.swift
//  WeatherForecast2.0
//
//  Created by Роман Мироненко on 25.01.2021.
//

import UIKit
import SnapKit

extension MainViewController {
    final class View: UIView {
        
        lazy var collectionView = setup(UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout())) {
            $0.register(registerClass: MainCollectionViewCell.Weather.self)
            $0.backgroundColor = .gray
        }
        
        init() {
            super.init(frame: .zero)
            
            backgroundColor = .white
            addSubview(collectionView)
            setupConstraints()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func compositionalLayout() -> UICollectionViewLayout {
            
            let config = UICollectionViewCompositionalLayoutConfiguration()
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(70)
                ),
                subitems: [
                    NSCollectionLayoutItem(
                        layoutSize: .init(
                            widthDimension: .fractionalWidth(1.0),
                            heightDimension: .fractionalHeight(1.0)
                        )
                    )
                ]
            )
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 16
            section.contentInsets = .init(top: 16, leading: 16, bottom: 16, trailing: 16)
            let layout = UICollectionViewCompositionalLayout(
                section: section,
                configuration: config
            )
            return layout
        }
        
        func setupConstraints() {
            collectionView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
}
