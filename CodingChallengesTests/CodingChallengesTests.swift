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

    // MARK: String Challenges
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
    
}
