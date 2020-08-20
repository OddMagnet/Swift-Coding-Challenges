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
}
