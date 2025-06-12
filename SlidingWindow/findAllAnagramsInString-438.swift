//
//  findAllAnagramsInString-438.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/6/25.
/*
 https://leetcode.com/problems/find-all-anagrams-in-a-string/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given two strings s and p, return an array of all the start indices of p's anagrams in s. You may return the answer in any order.

  

 Example 1:

 Input: s = "cbaebabacd", p = "abc"
 Output: [0,6]
 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 Example 2:

 Input: s = "abab", p = "ab"
 Output: [0,1,2]
 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
  

 Constraints:

 1 <= s.length, p.length <= 3 * 104
 s and p consist of lowercase English letters.

 */


func findAnagrams(_ s: String, _ p: String) -> [Int] {
    guard p.count <= s.count else { return [] }
    let p = Array(p)
    let s = Array(s)
    let pCounts =  p.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var win = s[..<p.count].reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = [Int]()
    for r in p.count..<s.count {
        if win == pCounts {
            result.append(r - p.count)
        }
        let lChar = s[r - p.count]
        let rChar = s[r]
        win[rChar, default: 0] += 1
        if win[lChar, default: 0] == 1 {
            win.removeValue(forKey:lChar)
        } else {
            win[lChar, default: 0] -= 1
        }
    }
    if win == pCounts {
        result.append(s.count - p.count)
    }
    return result
}
