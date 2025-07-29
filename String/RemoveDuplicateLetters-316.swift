//
//  RemoveDuplicateLetters-316.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/29/25.
/*
 https://leetcode.com/problems/remove-duplicate-letters/description/?envType=problem-list-v2&envId=string
 
 Given a string s, remove duplicate letters so that every letter appears once and only once. You must make sure your result is the smallest in lexicographical order among all possible results.

  

 Example 1:

 Input: s = "bcabc"
 Output: "abc"
 Example 2:

 Input: s = "cbacdcbc"
 Output: "acdb"
  

 Constraints:

 1 <= s.length <= 104
 s consists of lowercase English letters.
  
 */

func removeDuplicateLetters(_ s: String) -> String {
    var map: [Character: Int] = [:], stack: [Character] = []
    var seen: Set<Character> = [], s = Array(s)
    for (index,char) in s.enumerated() {
        map[char] = index
    }
    for (index,char) in s.enumerated() where !seen.contains(char)  {
        while !stack.isEmpty && char < stack.last! && map[stack.last!]! > index {
            let prevChar = stack.removeLast()
            seen.remove(prevChar)
        }
        seen.insert(char)
        stack.append(char)
    }
    return String(stack)
}
