//
//  PuzzleSection.swift
//  
//
//  Created by Shunya Yamada on 2023/08/17.
//

import Shared
import UIKit

enum PuzzleSection: DiffableDataSourceSection {
    case key(Int)
    case chords(Int)

    func layout(with environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch self {
        case .key:
            let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(44), heightDimension: .absolute(24))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(44), heightDimension: .absolute(24))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 12, trailing: 16)
            return section
        case .chords:
            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(64), heightDimension: .absolute(128))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(64), heightDimension: .absolute(128))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = -2
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16)
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
    }
}
