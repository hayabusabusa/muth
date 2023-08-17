//
//  PuzzleItem.swift
//  
//
//  Created by Shunya Yamada on 2023/08/17.
//

import Shared
import UIKit

enum PuzzleItem: DiffableDataSourceItem {
    case key
    case chords

    func cell(collectionView: UICollectionView, viewController: UIViewController, indexPath: IndexPath) -> UICollectionViewCell {
        switch self {
        case .key:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PuzzleKeyCell.self), for: indexPath) as! PuzzleKeyCell
            return cell
        case .chords:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PuzzleChordsCell.self), for: indexPath) as! PuzzleChordsCell
            return cell
        }
    }
}
