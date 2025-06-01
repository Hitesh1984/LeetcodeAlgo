//
//  AlienDictionary-269.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/14/25.
//
/*
 https://leetcode.com/problems/alien-dictionary/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 There is a new alien language that uses the English alphabet. However, the order of the letters is unknown to you.

 You are given a list of strings words from the alien language's dictionary. Now it is claimed that the strings in words are sorted lexicographically by the rules of this new language.

 If this claim is incorrect, and the given arrangement of string in words cannot correspond to any order of letters, return "".

 Otherwise, return a string of the unique letters in the new alien language sorted in lexicographically increasing order by the new language's rules. If there are multiple solutions, return any of them.

  

 Example 1:

 Input: words = ["wrt","wrf","er","ett","rftt"]
 Output: "wertf"
 Example 2:

 Input: words = ["z","x"]
 Output: "zx"
 Example 3:

 Input: words = ["z","x","z"]
 Output: ""
 Explanation: The order is invalid, so return "".
  

 Constraints:

 1 <= words.length <= 100
 1 <= words[i].length <= 100
 words[i] consists of only lowercase English letters.
 
 */

import Foundation

func alienOrder(_ words: [String]) -> String {
    var adjList: [Character: [Character]] = [:]
    var seen: [Character: Bool] = [:]
    var result = ""
    for index in 0..<words.count - 1 {
        let word1 = words[index]
        let word2 = words[index + 1]
        if word1.count > word2.count && word1.prefix(word2.count) == word2 {
            return ""
        }
        let w1 = Array(word1)
        let w2 = Array(word2)
        let length = min(word1.count, word2.count)
        for wordIndex in 0..<length {
            let cha1 = w1[wordIndex]
            let cha2 = w2[wordIndex]
            if cha1 != cha2 {
                adjList[cha1, default: []].append(cha2)
                break
            }
        }
    }
    func dfs(character: Character) -> Bool {
        if let val = seen[character] {
            return val
        }
        seen[character] = false
        for adj in adjList[character, default: []] {
            if !dfs(character: adj) {
                return false
            }
        }
        seen[character] = true
        result = String(character) + result
        return true
    }
    for word in words {
        for character in word {
            if !dfs(character: character) {
                return ""
            }
        }
    }
    if result.count < adjList.count {
        return ""
    }
    return result
}
