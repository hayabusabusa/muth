//
//  AnyChord.swift
//  
//
//  Created by Shunya Yamada on 2023/08/16.
//

import Foundation
import Theory

/// `any Chord` では `==` で比較できないため、`Chord` を比較するための具体的な型.
struct AnyChord: Hashable, Chord {
    let name: String
    let notes: [ChordDegree: Note]

    init(from chord: Chord) {
        name = chord.name
        notes = chord.notes
    }
}
