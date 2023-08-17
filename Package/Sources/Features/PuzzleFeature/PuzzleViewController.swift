//
//  PuzzleViewController.swift
//  
//
//  Created by Shunya Yamada on 2023/08/17.
//

import Shared
import Theory
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
        configureNavigation()
        configureStubDataSource()
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

    func configureNavigation() {
        navigationItem.title = "ダイアトニックコード"
    }

    func configureStubDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<PuzzleSection, PuzzleItem>()

        Note.allCases.enumerated().forEach { enumerated in
            let majorScale = MajorScale(root: enumerated.element)
            let chordsItems = majorScale.diatonicTriadChords
                .reduce(into: [(key: ScaleDegree, value: Chord)]()) { $0.append((key: $1.key, value: $1.value)) }
                .sorted(by: { $0.key.rawValue < $1.key.rawValue })
                .map { PuzzleItem.chords(PuzzleChordsCell.Configuration(degreeName: $0.key.name, chordName: $0.value.name)) }

            snapshot.appendSections([.key(enumerated.offset)])
            snapshot.appendItems([.key(PuzzleKeyCell.Configuration(key: majorScale.root.name))], toSection: .key(enumerated.offset))
            snapshot.appendSections([.chords(enumerated.offset)])
            snapshot.appendItems(chordsItems, toSection: .chords(enumerated.offset))
        }

        dataSource.apply(snapshot)
    }
}

extension ScaleDegree {
    var name: String {
        switch self {
        case .i:
            return "I"
        case .ii:
            return "II"
        case .iii:
            return "III"
        case .iv:
            return "IV"
        case .v:
            return "V"
        case .vi:
            return "VI"
        case .vii:
            return "VII"
        }
    }
}

#if DEBUG
import SwiftUI

struct PuzzleViewController_Preview: PreviewProvider {
    static var previews: some View {
        Preview(
            content: Wrapped<PuzzleViewController>()
        )
        .ignoresSafeArea(edges: .bottom)
    }
}
#endif
