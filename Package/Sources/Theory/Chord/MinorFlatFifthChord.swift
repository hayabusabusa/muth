//
//  MinorFlatFifthChord.swift
//  
//
//  Created by Shunya Yamada on 2023/08/16.
//

import Foundation

/// マイナー♭5 th コード.
public struct MinorFlatFifthChord: TriadChord {
    public let root: Note
    public let third: Note
    public let fifth: Note
    public let notes: [ChordDegree : Note]

    public var name: String {
        root.name + "m-5"
    }
}

public extension MinorFlatFifthChord {
    /// ルート音、3 度、5 度の音を指定してマイナー♭5 th コードを作る.
    ///
    /// マイナー♭5 th コードなので 3 度の音は短 3 度、5 度の音は減 5 度になる.
    /// - Parameters:
    ///   - root: ルート音.
    ///   - third: 3 度の音.
    ///   - fifth: 5 度の音.
    init(root: Note,
         third: Note,
         fifth: Note) {
        self.root = root
        self.third = third
        self.fifth = fifth
        notes = [
            .root: root,
            .minorThird: third,
            .diminishFifth: fifth
        ]
    }
}
