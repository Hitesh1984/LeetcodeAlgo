//
//  stringMatchingInArray-1408.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/25/25.
/*
 https://leetcode.com/problems/string-matching-in-an-array/description/?envType=problem-list-v2&envId=string-matching
 
 Given an array of string words, return all strings in words that are a substring of another word. You can return the answer in any order.

  

 Example 1:

 Input: words = ["mass","as","hero","superhero"]
 Output: ["as","hero"]
 Explanation: "as" is substring of "mass" and "hero" is substring of "superhero".
 ["hero","as"] is also a valid answer.
 Example 2:

 Input: words = ["leetcode","et","code"]
 Output: ["et","code"]
 Explanation: "et", "code" are substring of "leetcode".
 Example 3:

 Input: words = ["blue","green","bu"]
 Output: []
 Explanation: No string of words is substring of another string.
  

 Constraints:

 1 <= words.length <= 100
 1 <= words[i].length <= 30
 words[i] contains only lowercase English letters.
 All the strings of words are unique.

 */

func stringMatching(_ words: [String]) -> [String] {
    var result: [String] = []
    let fullWord = words.joined(separator: " ")
    for (index, word) in words.enumerated() {
        for (otherIdx, otherWord) in words.enumerated() where otherIdx != index {
            if let _ = otherWord.range(of: word) {
                result.append(word)
                break
            }
        }
    }
    return result
}
