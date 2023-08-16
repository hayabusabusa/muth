//
//  MinorChord.swift
//  
//
//  Created by Shunya Yamada on 2023/08/16.
//

import Foundation

/// マイナーコード.
public struct MinorChord: TriadChord {
    public let root: Note
    public let third: Note
    public let fifth: Note
    public let notes: [ChordDegree : Note]

    public var name: String {
        root.name
    }
}

public extension MinorChord {
    /// ルート音、3 度、5 度の音を指定してマイナーコードを作る.
    ///
    /// メジャーコードなので 3 度の音は短 3 度になる.
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
            .perfectFifth: fifth
        ]
    }
}
