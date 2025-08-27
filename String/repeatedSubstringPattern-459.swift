//
//  repeatedSubstringPattern-459.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/21/25.
/*
 https://leetcode.com/problems/repeated-substring-pattern/description/?envType=problem-list-v2&envId=string-matching
 
 Given a string s, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together.

  

 Example 1:

 Input: s = "abab"
 Output: true
 Explanation: It is the substring "ab" twice.
 Example 2:

 Input: s = "aba"
 Output: false
 Example 3:

 Input: s = "abcabcabcabc"
 Output: true
 Explanation: It is the substring "abc" four times or the substring "abcabc" twice.
  

 Constraints:

 1 <= s.length <= 104
 s consists of lowercase English letters.
  
 */

func repeatedSubstringPattern(_ s: String) -> Bool {
    // approach is s+s will have repeated string, but remove 1st and last char; the substring will come atleast twice
    // step 1: concatenate s with s; step 2: remove first, last char; step 3: check now if new string has s
    
    var stwice = s + s
    stwice.removeFirst()
    stwice.removeLast()
    return stwice.contains(s) // O(n)
}
