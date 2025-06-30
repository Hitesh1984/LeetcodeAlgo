//
//  lexicographicallyMinStringAfterRemovingStars-3170.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/26/25.
//

import Collections

func clearStars(_ s: String) -> String {
    var pq = Heap<Letter>()
    for (i, c) in s.enumerated() {
        if c == "*" {
            pq.popMin()
        } else {
            pq.insert(Letter(idx: i, char: c))
        }
    }
    return String(pq.unordered.sorted { $0.idx < $1.idx }.map(\.char))
}

struct Letter: Comparable {
    let idx: Int
    let char: Character
    static func < (lhs: Letter, rhs: Letter) -> Bool {
        if lhs.char == rhs.char {
            return lhs.idx > rhs.idx
        }
        return lhs.char < rhs.char
    }
}
