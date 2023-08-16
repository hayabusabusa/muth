//
//  Chord.swift
//  
//
//  Created by Shunya Yamada on 2023/08/16.
//

import Foundation

/// 各種コードに準拠させる基本となる Protocol.
public protocol Chord {
    /// コード名.
    var name: String { get }
    /// コードの構成音.
    var notes: [ChordDegree: Note] { get }
}
