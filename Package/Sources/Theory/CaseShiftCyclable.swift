//
//  CaseShiftCyclable.swift
//  
//
//  Created by Shunya Yamada on 2023/08/16.
//

import Foundation

/// Enum の case を循環させてずらすことができるようにする Protocol.
public protocol CaseShiftCyclable: RawRepresentable, CaseIterable {}

extension CaseShiftCyclable where RawValue == Int {
    /// case を循環させながら数値分ずらす.
    /// - Parameter interval: ずらす間隔.
    /// - Returns: ずらした case.
    public func shift(_ interval: Int) -> Self {
        let rawSum = rawValue + interval
        let allCasesCount = Self.allCases.count
        let value = rawSum < 0 ? (allCasesCount - abs(rawSum % allCasesCount)) : rawSum % allCasesCount

        guard let shifted = Self(rawValue: value) else {
            fatalError()
        }
        return shifted
    }
}
