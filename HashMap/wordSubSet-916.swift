//
//  wordSubSet-916.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/17/25.
/*
 https://leetcode.com/problems/word-subsets/description/?envType=problem-list-v2&envId=hash-table
 
 You are given two string arrays words1 and words2.

 A string b is a subset of string a if every letter in b occurs in a including multiplicity.

 For example, "wrr" is a subset of "warrior" but is not a subset of "world".
 A string a from words1 is universal if for every string b in words2, b is a subset of a.

 Return an array of all the universal strings in words1. You may return the answer in any order.

  

 Example 1:

 Input: words1 = ["amazon","apple","facebook","google","leetcode"], words2 = ["e","o"]

 Output: ["facebook","google","leetcode"]

 Example 2:

 Input: words1 = ["amazon","apple","facebook","google","leetcode"], words2 = ["lc","eo"]

 Output: ["leetcode"]

 Example 3:

 Input: words1 = ["acaac","cccbb","aacbb","caacc","bcbbb"], words2 = ["c","cc","b"]

 Output: ["cccbb"]

  

 Constraints:

 1 <= words1.length, words2.length <= 104
 1 <= words1[i].length, words2[i].length <= 10
 words1[i] and words2[i] consist only of lowercase English letters.
 All the strings of words1 are unique.
 
 */

func wordSubsets(_ words1: [String], _ words2: [String]) -> [String] {
    let word2Map = words2.reduce(into: [Character: Int]()) {
        let word2 = Array($1)
        var charMap = [Character: Int]()
        for char in word2 {
            charMap[char, default: 0] += 1
        }
        for (key, value) in charMap {
            if value > $0[key, default: 0] {
                $0[key] = value
            }
        }
    }
    var res = [String]()
    for word in words1 {
        let wordChar = Array(word)
        var charMap = [Character: Int]()
        for char in wordChar {
            charMap[char, default: 0] += 1
        }
        var shouldAdd = true
        for (key, value) in word2Map {
            if value > charMap[key, default: 0] {
                shouldAdd = false
                break
            }
        }
        if shouldAdd {
            res.append(word)
        }
    }
    return res
}
