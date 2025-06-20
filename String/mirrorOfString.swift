//
//  mirrorOfString.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/12/25.
//

import Foundation

/*
 convert string to mirorr string
 Replace lowercase a to capital Z
 Replace lowercase b to capital Y
 ..................z to Capital A
 ... Like wise
 Replace Capital a to lowerCase z
 Replace Capital b to lowerCase y
 Replace Capital z to lowerCase a
 
 if any char is  apart from letter, than throw Error.
 
 
 ex. 1) aBc = ZyX
 */


enum MirrorCaseError: Error, CustomStringConvertible {
    case invalidInput

    var description: String {
        switch self {
        case .invalidInput:
            return "Invalid input: only alphabetic characters allowed"
        }
    }
}

func mirrorCase(_ input: String) throws -> String {
    var result = ""

    for char in input {
        guard char.isLetter else {
            throw MirrorCaseError.invalidInput
        }

        if char.isLowercase {
            // Mirror: 'a' → 'Z', 'b' → 'Y', ..., 'z' → 'A'
            if let asciiValue = char.asciiValue {
                let mirroredAscii = UInt8(155) - asciiValue  // 155 = ASCII('a') + ASCII('Z')
                result.append(Character(UnicodeScalar(mirroredAscii)))
            }
        } else if char.isUppercase {
            // Mirror: 'A' → 'z', 'B' → 'y', ..., 'Z' → 'a'
            if let asciiValue = char.asciiValue {
                let mirroredAscii = UInt8(187) - asciiValue  // 187 = ASCII('A') + ASCII('z')
                result.append(Character(UnicodeScalar(mirroredAscii)))
            }
        }
    }

    return result
}

func testCase() {
    do {
        let result = try mirrorCase("abYZmnABCz")
        print(result)
    } catch {
        print(error.localizedDescription)
    }
}

/* exampl eof using try? */
func loadContentsOfFile(at url: URL) -> String? {
    guard let data = try? Data(contentsOf: url) else {
        return nil
    }

    return String(data: data, encoding: .utf8)
}
