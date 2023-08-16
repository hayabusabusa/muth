//
//  Scale.swift
//  
//
//  Created by Shunya Yamada on 2023/08/16.
//

import Foundation

/// 各種スケールに適合させる基本となる Protocol.
public protocol Scale {
    /// スケールのルート音.
    var root: Note { get }
    /// スケールの名前.
    var name: String { get }
    /// スケール内の構成音一覧.
    var notes: [ScaleDegree: Note] { get }
}

public extension Scale {
    /// 3 和音のダイアトニックコード一覧を返す.
    var diatonicTriadChords: [ScaleDegree: any Chord] {
        notes.reduce(into: [ScaleDegree: any Chord]()) { $0[$1.key] = makeDiatonicTriadChord(forRootDegree: $1.key) }
    }
}

extension Scale {
    /// 3 和音のダイアトニックコードを作成する.
    /// - Parameter degree: ダイアトニックコードのルートとなる音のスケール内の度数.
    /// - Returns: 3 和音のダイアトニックコード.
    func makeDiatonicTriadChord(forRootDegree degree: ScaleDegree) -> any TriadChord {
        guard let root = notes[degree],
              let third = notes[degree.shift(2)],
              let fifth = notes[degree.shift(4)] else {
            fatalError()
        }

        let thirdInterval = root.distance(to: third)
        let fifthInterval = third.distance(to: fifth)
        switch (thirdInterval, fifthInterval) {
        case (4, 3):
            // ルートから3度までの間隔、3度から5度までの間隔が長3度、短3度になる場合はメジャーコード.
            return MajorChord(root: root, third: third, fifth: fifth)
        case (3, 4):
            // ルートから3度までの間隔、3度から5度までの間隔が短3度、長3度になる場合はマイナーコード.
            return MinorChord(root: root, third: third, fifth: fifth)
        case (3, 3):
            // ルートから3度までの間隔、3度から5度までの間隔が短3度、短3度になる場合はマイナー♭5thコード.
            return MinorFlatFifthChord(root: root, third: third, fifth: fifth)
        default:
            fatalError()
        }
    }
}
