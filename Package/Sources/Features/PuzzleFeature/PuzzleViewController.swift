//
//  PuzzleViewController.swift
//  
//
//  Created by Shunya Yamada on 2023/08/17.
//

import UIKit

final class PuzzleViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = makeCollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PuzzleKeyCell.self, forCellWithReuseIdentifier: String(describing: PuzzleKeyCell.self))
        collectionView.register(PuzzleChordsCell.self, forCellWithReuseIdentifier: String(describing: PuzzleChordsCell.self))
        return collectionView
    }()

    private lazy var dataSource: UICollectionViewDiffableDataSource<PuzzleSection, PuzzleItem> = {
        UICollectionViewDiffableDataSource(collectionView: collectionView) { [weak self] collectionView, indexPath, itemIdentifier in
            guard let self else { return nil }
            return itemIdentifier.cell(collectionView: collectionView, viewController: self, indexPath: indexPath)
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
    }
}

private extension PuzzleViewController {
    func configureSubviews() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

    func makeCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] section, environment in
            self?.dataSource.snapshot().sectionIdentifiers[section].layout(with: environment)
        }
    }
}
