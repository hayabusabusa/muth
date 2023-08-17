//
//  PuzzleKeyCell.swift
//  
//
//  Created by Shunya Yamada on 2023/08/17.
//

import UIKit

final class PuzzleKeyCell: UICollectionViewCell {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Key C"
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSubviews()
    }
}

private extension PuzzleKeyCell {
    func configureSubviews() {
        backgroundColor = .systemBlue.withAlphaComponent(0.2)
        layer.cornerRadius = 12

        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        ])
    }
}
