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

    // Challenge 29: Documents directory
    func challenge29() -> URL {
        let documentPaths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(documentPaths[0])
        return documentPaths[0]
    }

    // Challenge 30: New JPEGs
    func challenge30(directory: String) -> [String] {
        // create path and filemanager constants
        let path = URL(fileURLWithPath: directory)
//        let path = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileManager = FileManager.default

        // make sure there are files in the directory
        guard let contentURLS = try? fileManager.contentsOfDirectory(at: path, includingPropertiesForKeys: nil) else { return [] }

        var images = [String]()
        // for every file in the directory
        for fileURL in contentURLS {
            // check the file extension
            if fileURL.pathExtension == "jpg" || fileURL.pathExtension == "jpeg" {
                // if it matches, try to get the attributes and creation date, if either of them isn't possible just continue with the next file
                guard let fileAttributes = try? fileManager.attributesOfItem(atPath: fileURL.path) else { continue }
                guard let fileCreationDate = fileAttributes[.creationDate] as? Date else { continue }
                // check if the file is newer than 48 hours (60 seconds * 60 minutes * 48 hours, -1 for past time)
                if fileCreationDate > Date(timeIntervalSinceNow: -1 * 60 * 60 * 48) {
                    images.append(fileURL.lastPathComponent)
                }
            }
        }
        return images
    }

    // Challenge 31: Copy recursively
    func challenge31(copyFrom source: String, copyTo destination: String) -> Bool {
        let fileManager = FileManager.default
        var exists: ObjCBool = false

        // make sure the given source is a directory that exists
        guard fileManager.fileExists(atPath: source, isDirectory: &exists) || exists.boolValue == false else { return false }

        // create urls for source and destination
        let sourceURL = URL(fileURLWithPath: source)
        let destinationURL = URL(fileURLWithPath: destination)

        // try copying
        do {
            try fileManager.copyItem(at: sourceURL, to: destinationURL)
        } catch {
            print("Error while trying to copy from \(source) to \(destination): \n\(error.localizedDescription)")
            return false
        }

        // everything went smoothly
        return true
    }
}
