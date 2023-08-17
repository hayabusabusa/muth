//
//  DiffableDataSourceSection.swift
//  
//
//  Created by Shunya Yamada on 2023/08/17.
//

import UIKit

/// `UICollectionViewDiffableDataSource` の `Section` に指定する Enum などに適合させる型.
public protocol DiffableDataSourceSection: Hashable {
    /// Section のレイアウトを返す.
    /// - Parameter environment: セクションごとの `NSCollectionLayoutEnvironment`
    /// - Returns: `NSCollectionLayoutSection`
    func layout(with environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection
}

/// `UICollectionViewDiffableDataSource` の `Item` に指定する Enum などに適合させる型.
public protocol DiffableDataSourceItem: Hashable {
    /// `Item` に対応するセルを作成して返す.
    /// - Parameters:
    ///   - collectionView: `Item` を表示する `UICollectionView`.
    ///   - viewController: `UICollectionView` を表示している `UIViewController`.
    ///   - indexPath: `Item`表示されている `IndexPath`
    /// - Returns: `UICollectionViewCell`.
    func cell(collectionView: UICollectionView, viewController: UIViewController, indexPath: IndexPath) -> UICollectionViewCell
}
