//
//  FileChallenges.swift
//  CodingChallenges
//
//  Created by Michael Brünen on 22.08.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import Foundation

struct FileChallenges {
    func urlFor(filename: String, withExtension ext: String) -> URL {
        guard let url = Bundle.main.url(forResource: filename, withExtension: ext) else { fatalError("Filename or extension error") }
        return url
    }

    // Challenge 27: Print last lines
    func challenge27(filename: String, lineCount: Int) -> String {
        // get file url
        guard let content = try? String(contentsOf: urlFor(filename: filename, withExtension: "txt")) else { return "" }
        // get lines and reverse them
        var lines = content.components(separatedBy: .newlines)
        lines.reverse()
        // ensure lineCount isn't higher than the amount of lines the file had
        let count = lineCount >= lines.count ? lines.count : lineCount
        // then return lineCount amount of lines from end to start
        return Array<String>(lines[..<count]).joined(separator: ", ")
    }

    // Challenge 28: Log a message
    func challenge28(file: String, message: String) {
        // load content or provide empty string for the first time
        var logContents = (try? String(contentsOfFile: file)) ?? ""
        // append new message
        logContents.append("\(Date()): \(message)\n")
        // try to write the file
        do {
            try logContents.write(toFile: file, atomically: true, encoding: .utf8)
        } catch {
            print("Error writing to log file: \(error.localizedDescription)")
        }
    }
}
