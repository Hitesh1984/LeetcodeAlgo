//
//  subStringMatchingPattern-3407.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/1/25.
/*
 
 https://leetcode.com/problems/substring-matching-pattern/description/?envType=problem-list-v2&envId=string-matching
 
 You are given a string s and a pattern string p, where p contains exactly one '*' character.

 The '*' in p can be replaced with any sequence of zero or more characters.

 Return true if p can be made a substring of s, and false otherwise.

  

 Example 1:

 Input: s = "leetcode", p = "ee*e"

 Output: true

 Explanation:

 By replacing the '*' with "tcod", the substring "eetcode" matches the pattern.

 Example 2:

 Input: s = "car", p = "c*v"

 Output: false

 Explanation:

 There is no substring matching the pattern.

 Example 3:

 Input: s = "luck", p = "u*"

 Output: true

 Explanation:

 The substrings "u", "uc", and "uck" match the pattern.

  

 Constraints:

 1 <= s.length <= 50
 1 <= p.length <= 50
 s contains only lowercase English letters.
 p contains only lowercase English letters and exactly one '*'
  
 */


func hasMatch(_ s: String, _ p: String) -> Bool {
    let arr_p = p.split(separator: "*")
    let arr_s = Array(s)
    
    if arr_p.count == 0 { return true }
    if arr_p.count == 1 { return s.contains(arr_p[0]) }
    
    let left = Array(arr_p[0]), right = Array(arr_p[1])
    
    for i in 0..<arr_s.count - p.count + 2 {
        if Array(arr_s[i..<i + left.count]) == left {
            for j in i+left.count..<arr_s.count - right.count + 1 {
                if Array(arr_s[j..<j + right.count]) == right {
                    return true
                }
            }
        }
    }
    return false
}
