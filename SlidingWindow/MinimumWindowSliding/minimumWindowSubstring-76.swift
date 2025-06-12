//
//  minimumWindowSubstring-76.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/22/25.
/*
 https://leetcode.com/problems/minimum-window-substring/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".
 
 The testcases will be generated such that the answer is unique.
 
 
 
 Example 1:
 
 Input: s = "ADOBECODEBANC", t = "ABC"
 Output: "BANC"
 Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
 Example 2:
 
 Input: s = "a", t = "a"
 Output: "a"
 Explanation: The entire string s is the minimum window.
 Example 3:
 
 Input: s = "a", t = "aa"
 Output: ""
 Explanation: Both 'a's from t must be included in the window.
 Since the largest window of s only has one 'a', return empty string.
 
 
 Constraints:
 
 m == s.length
 n == t.length
 1 <= m, n <= 105
 s and t consist of uppercase and lowercase English letters.
 
 */

func minWindow(_ s: String, _ t: String) -> String {
    var needMap = [Character:Int]()
    for char in t {
        needMap[char, default:0] += 1
    }
    var start = 0
    var end = 0
    var minLength = Int.max
    var minStart = 0
    var missing = t.count
    var s = Array(s)
    while(end < s.count) {
        let current = s[end]
        if needMap[current, default:0] > 0 {
            missing -= 1
        }
        needMap[current, default:0] -= 1
        while(missing == 0 && start < s.count) {
            if(minLength > end - start + 1) {
                minLength =  end - start + 1
                minStart = start
            }
            let head = s[start]
            if needMap[head, default:0] >= 0 {
                missing += 1
            }
            needMap[head, default:0] += 1
            start += 1
        }
        end += 1
    }
    return minLength == Int.max ? "" : String(s[minStart..<minStart + minLength])
}
