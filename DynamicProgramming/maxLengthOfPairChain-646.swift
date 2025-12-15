//
//  maxLengthOfPairChain-646.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 11/4/25.
//

import Foundation

func findLongestChain(_ pairs: [[Int]]) -> Int {
    let len = pairs.count
    if len < 2 {
        return len
    }
    let sortedPairs = pairs.sorted { $0[1] < $1[1] }
    var chain = 1
    var prev = sortedPairs[0]
    for (ind, pair) in sortedPairs.enumerated() where ind > 0 {
        
        if prev[1] < pair[0] {
            chain += 1
            prev = pair
        }
    }
    return chain
}
