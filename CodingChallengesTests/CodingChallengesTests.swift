//
//  CodingChallengesTests.swift
//  CodingChallengesTests
//
//  Created by Michael Brünen on 16.08.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import XCTest
@testable import CodingChallenges

class CodingChallengesTests: XCTestCase {
    var str: StringChallenges = StringChallenges()
    var num: NumberChallenges = NumberChallenges()
    var file: FileChallenges = FileChallenges()

    // MARK: String Challenges -
    func testChallenge1() {
        XCTAssert(str.challenge1(input: "No duplicates") == true, "Challenge 1 failed")
        XCTAssert(str.challenge1(input: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
        XCTAssert(str.challenge1(input: "AaBbCc") == true, "Challenge 1 failed")
        XCTAssert(str.challenge1(input: "Hello, world") == false, "Challenge 1 failed")
    }

    func testChallenge2() {
        XCTAssert(str.challenge2(input: "rotator") == true, "Challenge 2 failed")
        XCTAssert(str.challenge2(input: "Rats live on no evil star") == true, "Challenge 2 failed")
        XCTAssert(str.challenge2(input: "Never odd or even") == false, "Challenge 2 failed")
        XCTAssert(str.challenge2(input: "Hello, world") == false, "Challenge 2 failed")
    }

    func testChallenge3() {
        XCTAssert(str.challenge3(input1: "abca", input2: "abca") == true, "Challenge 3 failed")
        XCTAssert(str.challenge3(input1: "abc", input2: "cba") == true, "Challenge 3 failed")
        XCTAssert(str.challenge3(input1: "a1 b2", input2: "b1 a2") == true, "Challenge 3 failed")
        XCTAssert(str.challenge3(input1: "abc", input2: "abca") == false, "Challenge 3 failed")
        XCTAssert(str.challenge3(input1: "abc", input2: "Abc") == false, "Challenge 3 failed")
        XCTAssert(str.challenge3(input1: "abc", input2: "cbAa") == false, "Challenge 3 failed")
        XCTAssert(str.challenge3(input1: "abcc", input2: "abca") == false, "Challenge 3 failed")
    }

    func testChallenge4() {
        XCTAssert("Hello, world".fuzzyContains("Hello") == true, "Challenge 4 failed")
        XCTAssert("Hello, world".fuzzyContains("WORLD") == true, "Challenge 4 failed")
        XCTAssert("Hello, world".fuzzyContains("Goodbye") == false, "Challenge 4 failed")
    }

    func testChallenge5() {
        XCTAssert(str.challenge5(char: "a", input: "The rain in Spain") == 2, "Challenge 5 failed")
        XCTAssert(str.challenge5(char: "i", input: "Mississippi") == 4, "Challenge 5 failed")
        XCTAssert(str.challenge5(char: "i", input: "Hacking with Swift") == 3, "Challenge 5 failed")
    }

    func testChallenge6() {
        XCTAssert(str.challenge6(input: "wombat") == "wombat", "Challenge 6 failed")
        XCTAssert(str.challenge6(input: "hello") == "helo", "Challenge 6 failed")
        XCTAssert(str.challenge6(input: "Mississippi") == "Misp", "Challenge 6 failed")
    }

    func testChallenge7() {
        XCTAssert(str.challenge7(input: "a   b   c") == "a b c", "Challenge 7 failed")
        XCTAssert(str.challenge7(input: "    a") == " a", "Challenge 7 failed")
        XCTAssert(str.challenge7(input: "abc") == "abc", "Challenge 7 failed")
    }

    func testChallenge8() {
        XCTAssert(str.challenge8(input: "abcde", rotated: "eabcd") == true, "Challenge 8 failed")
        XCTAssert(str.challenge8(input: "abcde", rotated: "cdeab") == true, "Challenge 8 failed")
        XCTAssert(str.challenge8(input: "abcde", rotated: "abced") == false, "Challenge 8 failed")
        XCTAssert(str.challenge8(input: "abc", rotated: "a") == false, "Challenge 8 failed")
    }

    func testChallenge9() {
        XCTAssert(str.challenge9(input: "The quick brown fox jumps over the lazy dog") == true, "Challenge 9 failed")
        XCTAssert(str.challenge9(input: "The quick brown fox jumped over the lazy dog") == false, "Challenge 9 failed")
    }

    func testChallenge10() {
        XCTAssert(str.challenge10(input: "Swift Coding Challenges") == (6, 15), "Challenge 10 failed")
        XCTAssert(str.challenge10(input: "Mississippi") == (4, 7), "Challenge 10 failed")
    }

    func testChallenge11() {
        XCTAssert(str.challenge11(input1: "Clamp", input2: "Cramp") == true, "Challenge 11 failed")
        XCTAssert(str.challenge11(input1: "Clamp", input2: "Crams") == true, "Challenge 11 failed")
        XCTAssert(str.challenge11(input1: "Clamp", input2: "Grams") == true, "Challenge 11 failed")
        XCTAssert(str.challenge11(input1: "Clamp", input2: "Grans") == false, "Challenge 11 failed")
        XCTAssert(str.challenge11(input1: "Clamp", input2: "Clam") == false, "Challenge 11 failed")
        XCTAssert(str.challenge11(input1: "clamp", input2: "maple") == false, "Challenge 11 failed")
    }

    func testChallenge12() {
        XCTAssert(str.challenge12(input: "swift switch swill swim") == "swi", "Challenge 12 failed")
        XCTAssert(str.challenge12(input: "flip flap flop") == "fl", "Challenge 12 failed")
    }

    func testChallenge13() {
        XCTAssert(str.challenge13(input: "aabbcc") == "a2b2c2", "Challenge 13 failed")
        XCTAssert(str.challenge13(input: "aaabaaabaaa") == "a3b1a3b1a3", "Challenge 13 failed")
        XCTAssert(str.challenge13(input: "aaAAaa") == "a2A2a2", "Challenge 13 failed")
    }

    func testChallenge14() {
        var results = [String]()
        str.challenge14(input: "a", results: &results)
        XCTAssert(results == ["a"], "Challenge 14 failed")

        results = []
        str.challenge14(input: "ab", results: &results)
        XCTAssert(results == ["ab", "ba"], "Challenge 14 failed")

        results = []
        str.challenge14(input: "abc", results: &results)
        XCTAssert(results == ["abc", "acb", "bac", "bca", "cab", "cba"], "Challenge 14 failed")

        results = []
        str.challenge14(input: "wombat", results: &results)
        XCTAssert(results.count == 720, "Challenge 14 failed")
    }

    func testChallenge15() {
        XCTAssert(str.challenge15(input: "Swift Coding Challenges") == "tfiwS gnidoC segnellahC", "Challenge 15 failed")
        XCTAssert(str.challenge15(input: "The quick brown fox") == "ehT kciuq nworb xof", "Challenge 15 failed")
    }

    // MARK: - Number Challenges -
    func testChallenge16() {
        XCTAssert(num.challenge16(input: 1) == "1", "Challenge 16 failed")
        XCTAssert(num.challenge16(input: 2) == "2", "Challenge 16 failed")
        XCTAssert(num.challenge16(input: 3) == "Fizz", "Challenge 16 failed")
        XCTAssert(num.challenge16(input: 4) == "4", "Challenge 16 failed")
        XCTAssert(num.challenge16(input: 5) == "Buzz", "Challenge 16 failed")
        XCTAssert(num.challenge16(input: 15) == "FizzBuzz", "Challenge 16 failed")
    }

    func testChallenge17() {
        XCTAssert((1...5).contains(num.challenge17(min: 1, max: 5)), "Challenge 17 failed")
        XCTAssert((8...10).contains(num.challenge17(min: 8, max: 10)), "Challenge 17 failed")
        XCTAssert((12...12).contains(num.challenge17(min: 12, max: 12)), "Challenge 17 failed")
        XCTAssert((12...18).contains(num.challenge17(min: 12, max: 18)), "Challenge 17 failed")
    }

    func testChallenge18() {
        XCTAssert(num.challenge18(input: 4, power: 3) == 64, "Challenge 18 failed")
        XCTAssert(num.challenge18(input: 2, power: 8) == 256, "Challenge 18 failed")
    }

    func testChallenge19() {
        var a = 1
        var b = 2
        num.challenge19(a: &a, b: &b)
        XCTAssert((a == 2 && b == 1), "Challenge 19 failed")
    }

    func testChallenge20() {
        XCTAssert(num.challenge20(input: 11) == true, "Challenge 20 failed")
        XCTAssert(num.challenge20(input: 13) == true, "Challenge 20 failed")
        XCTAssert(num.challenge20(input: 4) == false, "Challenge 20 failed")
        XCTAssert(num.challenge20(input: 9) == false, "Challenge 20 failed")
        XCTAssert(num.challenge20(input: 16777259) == true, "Challenge 20 failed")
    }

    func testChallenge21() {
        XCTAssert(num.challenge21(input: 12) == (10, 17), "Challenge 21 failed")
        XCTAssert(num.challenge21(input: 28) == (26, 35), "Challenge 21 failed")
    }

    func testChallenge22() {
        XCTAssert(num.challenge22(input: 32) == 4, "Challenge 22 failed")
        XCTAssert(num.challenge22(input: 4) == 32, "Challenge 22 failed")
        XCTAssert(num.challenge22(input: 41) == 148, "Challenge 22 failed")
        XCTAssert(num.challenge22(input: 148) == 41, "Challenge 22 failed")
    }

    func testChallenge23() {
        XCTAssert(num.challenge23(input: "01010101") == true, "Challenge 23 failed")
        XCTAssert(num.challenge23(input: "123456789") == true, "Challenge 23 failed")
        XCTAssert(num.challenge23(input: "9223372036854775808") == true, "Challenge 23 failed")
        XCTAssert(num.challenge23(input: "1.01") == false, "Challenge 23 failed")
    }

    func testChallenge24() {
        XCTAssert(num.challenge24(input: "a1b2c3") == 6, "Challenge 24 failed")
        XCTAssert(num.challenge24(input: "a10b20c30") == 60, "Challenge 24 failed")
        XCTAssert(num.challenge24(input: "h8ers") == 8, "Challenge 24 failed")
    }

    func testChallenge25() {
        XCTAssert(num.challenge25(input: 9) == 3, "Challenge 25 failed")
        XCTAssert(num.challenge25(input: 16777216) == 4096, "Challenge 25 failed")
        XCTAssert(num.challenge25(input: 16) == 4, "Challenge 25 failed")
        XCTAssert(num.challenge25(input: 15) == 3, "Challenge 25 failed")
    }

    func testChallenge26() {
        XCTAssert(num.challenge26(subtract: 5, from: 9) == 4, "Challenge 26 failed")
        XCTAssert(num.challenge26(subtract: 10, from: 30) == 20, "Challenge 26 failed")
    }

    // MARK: - File Challenges -
    func testChallenge27() {
        XCTAssert(file.challenge27(filename: "challenge27", lineCount: 3) == "Twelfth Night, Othello, Macbeth", "Challenge 27 failed")
        XCTAssert(file.challenge27(filename: "challenge27", lineCount: 100) == "Twelfth Night, Othello, Macbeth, King Lear, Julius Caesar, Hamlet, Cymbeline, Coriolanus, Antony And Cleopatra", "Challenge 27 failed")
        XCTAssert(file.challenge27(filename: "challenge27", lineCount: 0) == "")
    }

    func testChallenge28() {
        let logFile = "challenge28.txt"
        let logMessage = "Testing the log file"
        file.challenge28(file: logFile, message: logMessage)
        let logContents = try! String(contentsOfFile: logFile)
        let lines = logContents.components(separatedBy: .newlines)
        XCTAssert(lines[lines.count-2].contains(logMessage), "Challenge 28 failed")
    }

    func testChallenge29() {
        XCTAssert(file.challenge29() == FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0], "Challenge 29 failed")
    }
}
