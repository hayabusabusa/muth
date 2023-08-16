//
//  ChordDegree.swift
//  
//
//  Created by Shunya Yamada on 2023/08/16.
//

import Foundation

/// コードの構成音で利用する度数を表す Enum.
public enum ChordDegree: Equatable, CaseIterable {
    /// ルート音.
    case root
    /// 長 3 度.
    case majorThird
    /// 短 3 度.
    case minorThird
    /// 完全 5 度.
    case perfectFifth
    /// 減 5 度.
    case diminishFifth
}
