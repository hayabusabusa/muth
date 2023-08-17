//
//  PuzzleItem.swift
//  
//
//  Created by Shunya Yamada on 2023/08/17.
//

import Shared
import UIKit

enum PuzzleItem: DiffableDataSourceItem {
    case key(PuzzleKeyCell.Configuration)
    case chords(PuzzleChordsCell.Configuration)

    func cell(collectionView: UICollectionView, viewController: UIViewController, indexPath: IndexPath) -> UICollectionViewCell {
        switch self {
        case .key(let configuration):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PuzzleKeyCell.self), for: indexPath) as! PuzzleKeyCell
            cell.configure(with: configuration)
            return cell
        case .chords(let configuration):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PuzzleChordsCell.self), for: indexPath) as! PuzzleChordsCell
            cell.configure(with: configuration)
            return cell
        }
    }
}
