//
//  PuzzleChordsCell.swift
//  
//
//  Created by Shunya Yamada on 2023/08/17.
//

import UIKit

final class PuzzleChordsCell: UICollectionViewCell {
    struct Configuration: Hashable {
        let degreeName: String
        let chordName: String?
    }

    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var degreeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .label
        label.textAlignment = .center
        label.backgroundColor = .systemBlue.withAlphaComponent(0.14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var chordLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSubviews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray.cgColor
    }

    func configure(with configuration: Configuration) {
        degreeLabel.text = configuration.degreeName
        chordLabel.text = configuration.chordName
    }
}

private extension PuzzleChordsCell {
    func configureSubviews() {
        addSubview(labelsStackView)
        addSubview(lineView)
        labelsStackView.addArrangedSubview(degreeLabel)
        labelsStackView.addArrangedSubview(chordLabel)
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.centerYAnchor.constraint(equalTo: centerYAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
}
