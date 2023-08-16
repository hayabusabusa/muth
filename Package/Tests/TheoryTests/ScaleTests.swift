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

        XCTContext.runActivity(named: "C メジャースケールのダイアトニックコードを正しく返すこと") { _ in
            let cMajorScale = MajorScale(root: .C)
            let diatonicChords = cMajorScale.diatonicTriadChords.reduce(into: [ScaleDegree: AnyChord]()) { $0[$1.key] = AnyChord(from: $1.value) }
            let expected: [ScaleDegree: AnyChord] = [
                .i: AnyChord(from: MajorChord(root: .C, third: .E, fifth: .G)),
                .ii: AnyChord(from: MinorChord(root: .D, third: .F, fifth: .A)),
                .iii: AnyChord(from: MinorChord(root: .E, third: .G, fifth: .B)),
                .iv: AnyChord(from: MajorChord(root: .F, third: .A, fifth: .C)),
                .v: AnyChord(from: MajorChord(root: .G, third: .B, fifth: .D)),
                .vi: AnyChord(from: MinorChord(root: .A, third: .C, fifth: .E)),
                .vii: AnyChord(from: MinorFlatFifthChord(root: .B, third: .D, fifth: .F))
            ]
            XCTAssertEqual(diatonicChords, expected)
        }

        XCTContext.runActivity(named: "E♭ メジャースケールの構成音が正しいこと") { _ in
            let eFlatMajorScale = MajorScale(root: .EFlat)
            let expected: [ScaleDegree: Note] = [
                .i: .EFlat,
                .ii: .F,
                .iii: .G,
                .iv: .GSharp,
                .v: .BFlat,
                .vi: .C,
                .vii: .D
            ]
            XCTAssertEqual(eFlatMajorScale.notes, expected)
        }

        XCTContext.runActivity(named: "E♭ メジャースケールのダイアトニックコードを正しく返すこと") { _ in
            let eFlatMajorScale = MajorScale(root: .EFlat)
            let diatonicChords = eFlatMajorScale.diatonicTriadChords.reduce(into: [ScaleDegree: AnyChord]()) { $0[$1.key] = AnyChord(from: $1.value) }
            let expected: [ScaleDegree: AnyChord] = [
                .i: AnyChord(from: MajorChord(root: .EFlat, third: .G, fifth: .BFlat)),
                .ii: AnyChord(from: MinorChord(root: .F, third: .GSharp, fifth: .C)),
                .iii: AnyChord(from: MinorChord(root: .G, third: .BFlat, fifth: .D)),
                .iv: AnyChord(from: MajorChord(root: .GSharp, third: .C, fifth: .EFlat)),
                .v: AnyChord(from: MajorChord(root: .BFlat, third: .D, fifth: .F)),
                .vi: AnyChord(from: MinorChord(root: .C, third: .EFlat, fifth: .G)),
                .vii: AnyChord(from: MinorFlatFifthChord(root: .D, third: .F, fifth: .GSharp))
            ]
            XCTAssertEqual(diatonicChords, expected)
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

        XCTContext.runActivity(named: "A ナチュラルマイナースケールのダイアトニックコードを正しく返すこと") { _ in
            let aNaturalMinorScale = NaturalMinorScale(root: .A)
            let diatonicChords = aNaturalMinorScale.diatonicTriadChords.reduce(into: [ScaleDegree: AnyChord]()) { $0[$1.key] = AnyChord(from: $1.value) }
            let expected: [ScaleDegree: AnyChord] = [
                .i: AnyChord(from: MinorChord(root: .A, third: .C, fifth: .E)),
                .ii: AnyChord(from: MinorFlatFifthChord(root: .B, third: .D, fifth: .F)),
                .iii: AnyChord(from: MajorChord(root: .C, third: .E, fifth: .G)),
                .iv: AnyChord(from: MinorChord(root: .D, third: .F, fifth: .A)),
                .v: AnyChord(from: MinorChord(root: .E, third: .G, fifth: .B)),
                .vi: AnyChord(from: MajorChord(root: .F, third: .A, fifth: .C)),
                .vii: AnyChord(from: MajorChord(root: .G, third: .B, fifth: .D))
            ]
            XCTAssertEqual(diatonicChords, expected)
        }

        XCTContext.runActivity(named: "E♭ ナチュラルマイナースケールの構成音が正しいこと") { _ in
            let eFlatNaturalMinorScale = NaturalMinorScale(root: .EFlat)
            let expected: [ScaleDegree: Note] = [
                .i: .EFlat,
                .ii: .F,
                .iii: .FSharp,
                .iv: .GSharp,
                .v: .BFlat,
                .vi: .B,
                .vii: .CSharp
            ]
            XCTAssertEqual(eFlatNaturalMinorScale.notes, expected)
        }

        XCTContext.runActivity(named: "E♭ ナチュラルマイナースケールのダイアトニックコードを正しく返せること") { _ in
            let eFlatNaturalMinorScale = NaturalMinorScale(root: .EFlat)
            let diatonicChords = eFlatNaturalMinorScale.diatonicTriadChords.reduce(into: [ScaleDegree: AnyChord]()) { $0[$1.key] = AnyChord(from: $1.value) }
            let expected: [ScaleDegree: AnyChord] = [
                .i: AnyChord(from: MinorChord(root: .EFlat, third: .FSharp, fifth: .BFlat)),
                .ii: AnyChord(from: MinorFlatFifthChord(root: .F, third: .GSharp, fifth: .B)),
                .iii: AnyChord(from: MajorChord(root: .FSharp, third: .BFlat, fifth: .CSharp)),
                .iv: AnyChord(from: MinorChord(root: .GSharp, third: .B, fifth: .EFlat)),
                .v: AnyChord(from: MinorChord(root: .BFlat, third: .CSharp, fifth: .F)),
                .vi: AnyChord(from: MajorChord(root: .B, third: .EFlat, fifth: .FSharp)),
                .vii: AnyChord(from: MajorChord(root: .CSharp, third: .F, fifth: .GSharp))
            ]
            XCTAssertEqual(diatonicChords, expected)
        }
    }
}
