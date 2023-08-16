//
//  TriadChord.swift
//  
//
//  Created by Shunya Yamada on 2023/08/16.
//

import Foundation

/// 3 和音のコードに適合させる Protocol.
public protocol TriadChord: Chord {
    /// ルートの音.
    var root: Note { get }
    /// 3 度の音.
    var third: Note { get }
    /// 5 度の音.
    var fifth: Note { get }
}
