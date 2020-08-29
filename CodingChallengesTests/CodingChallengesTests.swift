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
    var str = StringChallenges()
    var num = NumberChallenges()
    var file = FileChallenges()
    var col = CollectionChallenges()
    var algo = AlgorithmChallenges()

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

    func testChallenge30() {
        XCTAssert(file.challenge30(directory: "SomeDirectory") == [], "Challenge 30 failed")
        // Make sure to copy some images to the specified directory before uncommenting the below test, also comment the above test then
//        XCTAssert(file.challenge30(directory: "SomeDirectory") == ["imageName.jpg"], "Challenge 30 failed")
    }

    // TODO: find a way to make the copying work on macos
    func testChallenge31() {
        // set up the paths
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        let documentsURL = URL(string: documentsDirectory)!
        let sourceURL = documentsURL.appendingPathComponent("Source")
        let destinationURL = documentsURL.appendingPathComponent("Destination")
        if !FileManager.default.fileExists(atPath: sourceURL.absoluteString) {
            do {
                try FileManager.default.createDirectory(atPath: sourceURL.absoluteString, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription);
            }
        }
        if !FileManager.default.fileExists(atPath: destinationURL.absoluteString) {
            do {
                try FileManager.default.createDirectory(atPath: destinationURL.absoluteString, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription);
            }
        }

        // create a test file to copy
        do {
            let scheme = URL(string: "file://")!
            let file = sourceURL.appendingPathComponent("challenge31", isDirectory: false).appendingPathExtension("txt")
            let fileURL = scheme.appendingPathComponent(file.absoluteString, isDirectory: false)
            try "Hello, World!".write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            print(error.localizedDescription);
        }

        // test the challenge function
        XCTAssert(file.challenge31(copyFrom: sourceURL.absoluteString, copyTo: destinationURL.absoluteString) == true, "Challenge 31 failed")
    }

    // TODO: Add rest of file challenges and their tests

    // MARK: - Collection Challenges -
    func testChallenge37() {
        XCTAssert(col.challenge37(input: [5, 15, 55, 515], countOf: "5") == 6, "Challenge 37 failed")
        XCTAssert(col.challenge37(input: [5, 15, 55, 515], countOf: "1") == 2, "Challenge 37 failed")
        XCTAssert(col.challenge37(input: [55555], countOf: "5") == 5, "Challenge 37 failed")
        XCTAssert(col.challenge37(input: [55555], countOf: "1") == 0, "Challenge 37 failed")
    }

    func testChallenge38() {
        XCTAssert(col.challenge38(input: [1, 2, 3, 4], count: 3) == [1, 2, 3], "Challenge 38 failed")
        XCTAssert(col.challenge38(input: ["q", "f", "k"], count: 10) == ["f", "k", "q"], "Challenge 38 failed")
        XCTAssert(col.challenge38(input: [256, 16], count: 3) == [16, 256], "Challenge 38 failed")
        XCTAssert(col.challenge38(input: [String](), count: 3) == [], "Challenge 38 failed")
    }

    func testChallenge39() {
        XCTAssert(col.challenge39(input: ["a", "abc", "ab"]) == ["abc", "ab", "a"], "Challenge 39 failed")
        XCTAssert(col.challenge39(input: ["paul", "taylor", "adele"]) == ["taylor", "adele", "paul"], "Challenge 39 failed")
        XCTAssert(col.challenge39(input: []) == [], "Challenge 39 failed")
    }

    func testChallenge40() {
        var testArray = Array(1...100)
        testArray.remove(at: 25)
        testArray.remove(at: 20)
        testArray.remove(at: 6)
        XCTAssert(col.challenge40(input: testArray) == [7, 21, 26], "Challenge 40 failed")
    }

    func testChallenge41() {
        XCTAssert(col.challenge41(input: [1, 2, 3]) == 2, "Challenge 41 failed")
        XCTAssert(col.challenge41(input: [1, 2, 9]) == 2, "Challenge 41 failed")
        XCTAssert(col.challenge41(input: [1, 3, 5, 7, 9]) == 5, "Challenge 41 failed")
        XCTAssert(col.challenge41(input: [1, 2, 3, 4]) == 2.5, "Challenge 41 failed")
        XCTAssert(col.challenge41(input: []) == nil, "Challenge 41 failed")
    }

    func testChallenge42() {
        XCTAssert(col.challenge42(input: [1, 2, 3], element: 1) == 0, "Challenge 42 failed")
        XCTAssert(col.challenge42(input: [1, 2, 3], element: 3) == 2, "Challenge 42 failed")
        XCTAssert(col.challenge42(input: [1, 2, 3], element: 5) == nil, "Challenge 42 failed")
    }

    func testChallenge43() {
        XCTAssert(col.challenge43(input: "abcdefghijklmnopqrstuvwxyz") == "a b c d e f g h i j k l m n o p q r s t u v w x y z", "Challenge 43 failed")
    }

    func testChallenge44() {
        XCTAssert(col.challenge44(input: [1, 2, 3, 4, 5]) == 3, "Challenge 44 failed")
        XCTAssert(col.challenge44(input: [1, 2, 3, 4]) == 3, "Challenge 44 failed")
        XCTAssert(col.challenge44(input: Array<Character>("abcdefghijklmnopqrstuvwxyz")) == "n", "Challenge 44 failed")
    }

    func testChallenge45() {
        let input = [2, 1, 3]

        var array = [Int]()
        col.challenge45(input: input, closure: { array.append($0.key) })
        XCTAssert(array == [1, 2, 3], "Challenge 45 failed")

        var sum = 0
        col.challenge45(input: input, closure: { sum += $0.key })
        XCTAssert(sum == 6, "Challenge 45 failed")
    }

    func testChallenge46() {
        col.challenge46()
//        XCTAssert([1, 2, 3].myMap({ String($0) }) == ["1", "2", "3"], "Challenge 46 failed")
//        XCTAssert(["1", "2", "3"].myMap({ Int($0) }) == [1, 2, 3], "Challenge 46 failed")
    }

    func testChallenge47() {
        XCTAssert(col.challenge47(input: [1, 2, 3]) == 1, "Challenge 47 failed")
        XCTAssert(col.challenge47(input: ["q", "f", "k"]) == "f", "Challenge 47 failed")
        XCTAssert(col.challenge47(input: [4096, 256, 16]) == 16, "Challenge 47 failed")
        XCTAssert(col.challenge47(input: [String]()) == nil, "Challenge 47 failed")
    }

    func testChallenge48() {
        var numbers = Deque<Int>()
        numbers.pushBack(5)
        numbers.pushBack(8)
        numbers.pushBack(3)
        XCTAssert(numbers.count == 3, "Challenge 48 failed")
        XCTAssert(numbers.popFront()! == 5, "Challenge 48 failed")
        XCTAssert(numbers.popBack()! == 3, "Challenge 48 failed")
        XCTAssert(numbers.popFront()! == 8, "Challenge 48 failed")
        XCTAssert(numbers.popBack() == nil, "Challenge 48 failed")
    }

    func testChallenge49() {
        XCTAssert(col.challenge49(1, 2, 2, 3, 3, 4) == 5, "Challenge 49 failed")
        XCTAssert(col.challenge49(5, 5, 5, 12, 12) == 12, "Challenge 49 failed")
        XCTAssert(col.challenge49(1, 1, 2, 2, 3, 3, 4, 4) == 10, "Challenge 49 failed")
    }

    func testChallenge50() {
        XCTAssert(col.challenge50(input: [0, 1, 1, -1, 2, 3, 1]) == 4...6, "Challenge 50 failed")
        XCTAssert(col.challenge50(input: [10, 20, 30, -10, -20, 10, 20]) == 0...2, "Challenge 50 failed")
        XCTAssert(col.challenge50(input: [1, -1, 2, -1]) == 2...2, "Challenge 50 failed")
        XCTAssert(col.challenge50(input: [2, 0, 2, 0, 2]) == 0...0, "Challenge 50 failed")
        XCTAssert(col.challenge50(input: [Int]()) == nil, "Challenge 50 failed")
    }

    func testChallenge51() {
        XCTAssert(col.challenge51(input: "abcdefghijklmnopqrstuvwxyz") == "z y x w v u t s r q p o n m l k j i h g f e d c b a", "Challenge 43 failed")
    }

    func testChallenge52() {
        XCTAssert(col.challenge52(input: [1, 2, 3]) == 6, "Challenge 52 failed")
        XCTAssert(col.challenge52(input: [1.0, 2.0, 3.0]) == Double(6.0), "Challenge 52 failed")
        XCTAssert(col.challenge52(input: Array<Float>([1.0, 2.0, 3.0])) == 6.0, "Challenge 52 failed")
    }

    func testChallenge53() {
        let list = LinkedList<UInt32>()
        var previousNode: LinkedListNode<UInt32>? = nil
        var linkBackNode: LinkedListNode<UInt32>? = nil
        let linkBackPoint = Int(arc4random_uniform(1000))

        for i in 1...1000 {
            let node = LinkedListNode(value: arc4random())

            if i == linkBackPoint { linkBackNode = node }

            if let predecessor = previousNode {
                predecessor.next = node
            } else {
                list.head = node
            }

            previousNode = node
        }

        previousNode?.next = linkBackNode

        XCTAssert(col.challenge53(input: list) === linkBackNode, "Challenge 53 failed")
    }

    func testChallenge54() {
        // Balanced
        XCTAssert(col.challenge54(input: [2, 1, 3]), "Challenge 54 failed")
        XCTAssert(col.challenge54(input: [5, 1, 7, 6, 2, 1, 9]), "Challenge 54 failed")
        XCTAssert(col.challenge54(input: [5, 1, 7, 6, 2, 1, 9, 1]), "Challenge 54 failed")
        XCTAssert(col.challenge54(input: [5, 1, 7, 6, 2, 1, 9, 1, 3]), "Challenge 54 failed")
        XCTAssert(col.challenge54(input: [50, 25, 100, 26, 101, 24, 99]), "Challenge 54 failed")
        XCTAssert(col.challenge54(input: [1]), "Challenge 54 failed")
        XCTAssert(col.challenge54(input: ["k", "t", "d", "a", "z", "m", "f"]), "Challenge 54 failed")
        XCTAssert(col.challenge54(input: [Character]()), "Challenge 54 failed")

        // Unbalanced
        XCTAssert(col.challenge54(input: [1, 2, 3, 4, 5]) == false, "Challenge 54 failed")
        XCTAssert(col.challenge54(input: [10, 5, 4, 3, 2, 1, 11, 12, 13, 14, 15]) == false, "Challenge 54 failed")
        XCTAssert(col.challenge54(input: ["f", "d", "c", "e", "a", "b"]) == false, "Challenge 54 failed")
    }

    // MARK: Algorithm Challenges

    
}
