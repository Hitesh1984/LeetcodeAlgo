//
//  consecutiveCharacters-1446.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/25/25.
/*
 https://leetcode.com/problems/consecutive-characters/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 The power of the string is the maximum length of a non-empty substring that contains only one unique character.

 Given a string s, return the power of s.

  

 Example 1:

 Input: s = "leetcode"
 Output: 2
 Explanation: The substring "ee" is of length 2 with the character 'e' only.
 Example 2:

 Input: s = "abbcccddddeeeeedcba"
 Output: 5
 Explanation: The substring "eeeee" is of length 5 with the character 'e' only.
  

 Constraints:

 1 <= s.length <= 500
 s consists of only lowercase English letters.

 */

func maxPower(_ s: String) -> Int {
    var s = Array(s)
    var maxLen = 0
    var cur = 0
    var last:Character = s[0]
    for char in s {
        if char == last {
            cur += 1
        } else {
            maxLen = max(cur, maxLen)
            cur = 1
            last = char
        }
    }
    maxLen = max(cur, maxLen)
    return maxLen
}
