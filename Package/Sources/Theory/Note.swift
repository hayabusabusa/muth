//
//  Note.swift
//  
//
//  Created by Shunya Yamada on 2023/08/15.
//

import Foundation

/// 音を表す Enum.
public enum Note: Int, Equatable, CaseShiftCyclable {
    /// `C` の音.
    case C
    /// `C#` の音.
    case CSharp
    /// `D` の音.
    case D
    /// `E♭` の音.
    case EFlat
    /// `E` の音.
    case E
    /// `F` の音.
    case F
    /// `F#` の音.
    case FSharp
    /// `G` の音.
    case G
    /// `G#` の音.
    case GSharp
    /// `A` の音.
    case A
    /// `B♭`の音.
    case BFlat
    /// `B` の音.
    case B

    public var name: String {
        switch self {
        case .C:
            return "C"
        case .CSharp:
            return "C#"
        case .D:
            return "D"
        case .EFlat:
            return "E♭"
        case .E:
            return "E"
        case .F:
            return "F"
        case .FSharp:
            return "F#"
        case .G:
            return "G"
        case .GSharp:
            return "G#"
        case .A:
            return "A"
        case .BFlat:
            return "B♭"
        case .B:
            return "B"
        }
    }

    /// 音と音の間隔を返す.
    /// - Parameter note: 計測対象の音.
    /// - Returns: 間隔.
    public func distance(to note: Note) -> Int {
        let allCasesCount = Self.allCases.count
        let up = note.rawValue - rawValue
        let absUp = up < 0 ? allCasesCount + up : up
        
        let down = rawValue - note.rawValue
        let absDown = down < 0 ? allCasesCount + down : down
        return min(absUp, absDown)
    }
}

extension Note: CustomStringConvertible {
    public var description: String {
        name
    }
}
