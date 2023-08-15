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
