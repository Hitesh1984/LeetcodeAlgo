//
//  longestSubstring.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/27/25.
//

/*
 https://leetcode.com/problems/longest-substring-without-repeating-characters/?envType=problem-list-v2&envId=sliding-window
 
 
 Given a string s, find the length of the longest substring without duplicate characters.

  

 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
  

 Constraints:

 0 <= s.length <= 5 * 104
 s consists of English letters, digits, symbols and spaces.
 
 */
import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
        var len = 0, chars = [Character]()
        for c in s {
            if let idx = chars.firstIndex(of: c) {
                chars.removeSubrange(0...idx)
            }
            chars.append(c)
            len = max(len, chars.count)
        }
        return len
}

//let ret = lengthOfLongestSubstring("abcabcbb")
//let ret = lengthOfLongestSubstring("aab")
//print(ret)
