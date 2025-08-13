//
//  palindromePermutation-266.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/16/25.
/*
 https://leetcode.com/problems/palindrome-permutation/description/
 
 Given a string s, return true if a permutation of the string could form a palindrome and false otherwise.

  

 Example 1:

 Input: s = "code"
 Output: false
 Example 2:

 Input: s = "aab"
 Output: true
 Example 3:

 Input: s = "carerac"
 Output: true
  

 Constraints:

 1 <= s.length <= 5000
 s consists of only lowercase English letters.

 */

func canPermutePalindrome(_ s: String) -> Bool {
    var unique: Set<Character> = []
    
    for char in s {
        if !unique.contains(char) {
            unique.insert(char)
        } else {
            unique.remove(char)
        }
    }
    return unique.count == 0 || unique.count == 1
}
