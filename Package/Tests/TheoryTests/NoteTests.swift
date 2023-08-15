//
//  NoteTests.swift
//  
//
//  Created by Shunya Yamada on 2023/08/15.
//

import XCTest

@testable import Theory

final class NoteTests: XCTestCase {
    func testName() {
        XCTContext.runActivity(named: "正しい音名を返すこと") { _ in
            let names = Note.allCases.map { $0.name }
            let descriptions = Note.allCases.map { $0.description }
            let expects = ["C", "C#", "D", "E♭", "E", "F", "F#", "G", "G#", "A", "B♭", "B"]
            XCTAssertEqual(names, expects)
            XCTAssertEqual(descriptions, expects)
        }
    }

    func testShift() {
        XCTContext.runActivity(named: "C から半音上にずらした場合の結果が C# になること") { _ in
            XCTAssertEqual(Note.C.shift(1), .CSharp)
        }

        XCTContext.runActivity(named: "C から全音上にずらした場合の結果が D になること") { _ in
            XCTAssertEqual(Note.C.shift(2), .D)
        }

        XCTContext.runActivity(named: "C から半音下にずらした場合の結果が B になること") { _ in
            XCTAssertEqual(Note.C.shift(-1), .B)
        }

        XCTContext.runActivity(named: "C から全音下にずらした場合の結果が B♭ になること") { _ in
            XCTAssertEqual(Note.C.shift(-2), .BFlat)
        }

        XCTContext.runActivity(named: "B から半音上にずらした場合の結果が C になること") { _ in
            XCTAssertEqual(Note.B.shift(1), .C)
        }

        XCTContext.runActivity(named: "B から全音上にずらした場合の結果が C# になること") { _ in
            XCTAssertEqual(Note.B.shift(2), .CSharp)
        }

        XCTContext.runActivity(named: "C からずらさない場合は C をそのまま返すこと") { _ in
            XCTAssertEqual(Note.C.shift(0), .C)
        }

        XCTContext.runActivity(named: "C から1オクターブずらした場合は C をそのまま返すこと") { _ in
            XCTAssertEqual(Note.C.shift(12), .C)
        }
    }

    func testDistance() {
        XCTContext.runActivity(named: "C から C# までの間隔は半音で返すこと") { _ in
            XCTAssertEqual(Note.C.distance(to: .CSharp), 1)
        }

        XCTContext.runActivity(named: "C から D までの間隔は全音で返すこと") { _ in
            XCTAssertEqual(Note.C.distance(to: .D), 2)
        }

        XCTContext.runActivity(named: "C から B までの間隔は半音で返すこと") { _ in
            XCTAssertEqual(Note.C.distance(to: .B), 1)
        }

        XCTContext.runActivity(named: "B から C までの間隔は半音で返すこと") { _ in
            XCTAssertEqual(Note.B.distance(to: .C), 1)
        }

        XCTContext.runActivity(named: "同音の場合は距離が 0 になること") { _ in
            XCTAssertEqual(Note.C.distance(to: .C), 0)
        }
    }
}
