//
//  XofKindInDeckOfCard-914.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/21/25.
/*
 https://leetcode.com/problems/x-of-a-kind-in-a-deck-of-cards/description/?envType=problem-list-v2&envId=hash-table
 
 You are given an integer array deck where deck[i] represents the number written on the ith card.

 Partition the cards into one or more groups such that:

 Each group has exactly x cards where x > 1, and
 All the cards in one group have the same integer written on them.
 Return true if such partition is possible, or false otherwise.

  

 Example 1:

 Input: deck = [1,2,3,4,4,3,2,1]
 Output: true
 Explanation: Possible partition [1,1],[2,2],[3,3],[4,4].
 Example 2:

 Input: deck = [1,1,1,2,2,2,3,3]
 Output: false
 Explanation: No possible partition.
  

 Constraints:

 1 <= deck.length <= 104
 0 <= deck[i] < 104

 */

func hasGroupsSizeX(_ deck: [Int]) -> Bool {
    var freq = [Int: Int]()
    for card in deck {
        freq[card, default: 0] += 1
    }
    let values = Array(freq.values)
    if values.count == 1 { return values[0] > 1 }
    var x = values[0]
    for i in 1..<values.count {
        x = gcd(x, values[i])
        if x == 1 {
            return false
        }
    }
    return true
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b
        if b == 0 { return a }
        return gcd(b, a % b)
    }
}
