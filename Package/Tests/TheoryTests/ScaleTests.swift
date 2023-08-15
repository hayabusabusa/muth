//
//  ScaleTests.swift
//  
//
//  Created by Shunya Yamada on 2023/08/16.
//

import XCTest

@testable import Theory

final class ScaleTests: XCTestCase {
    func testMajorScale() {
        XCTContext.runActivity(named: "C メジャースケールの構成音が正しいこと") { _ in
            let cMajorScale = MajorScale(root: .C)
            let expected: [ScaleDegree: Note] = [
                .i: .C,
                .ii: .D,
                .iii: .E,
                .iv: .F,
                .v: .G,
                .vi: .A,
                .vii: .B
            ]
            XCTAssertEqual(cMajorScale.notes, expected)
        }

        XCTContext.runActivity(named: "E♭ メジャースケールの構成音が正しいこと") { _ in
            let cMajorScale = MajorScale(root: .EFlat)
            let expected: [ScaleDegree: Note] = [
                .i: .EFlat,
                .ii: .F,
                .iii: .G,
                .iv: .GSharp,
                .v: .BFlat,
                .vi: .C,
                .vii: .D
            ]
            XCTAssertEqual(cMajorScale.notes, expected)
        }
    }

    func testMinorScale() {
        XCTContext.runActivity(named: "A ナチュラルマイナースケールの構成音が正しいこと") { _ in
            let aNaturalMinorScale = NaturalMinorScale(root: .A)
            let expected: [ScaleDegree: Note] = [
                .i: .A,
                .ii: .B,
                .iii: .C,
                .iv: .D,
                .v: .E,
                .vi: .F,
                .vii: .G
            ]
            XCTAssertEqual(aNaturalMinorScale.notes, expected)
        }

        XCTContext.runActivity(named: "E♭ ナチュラルマイナースケールの構成音が正しいこと") { _ in
            let aNaturalMinorScale = NaturalMinorScale(root: .EFlat)
            let expected: [ScaleDegree: Note] = [
                .i: .EFlat,
                .ii: .F,
                .iii: .FSharp,
                .iv: .GSharp,
                .v: .BFlat,
                .vi: .B,
                .vii: .CSharp
            ]
            XCTAssertEqual(aNaturalMinorScale.notes, expected)
        }
    }
}
