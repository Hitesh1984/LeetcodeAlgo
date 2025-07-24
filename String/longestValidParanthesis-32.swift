//
//  longestValidParanthesis-32.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/23/25.
/*

https://leetcode.com/problems/longest-valid-parentheses/

 Given a string containing just the characters '(' and ')', return the length of the longest valid (well-formed) parentheses substring.

  

 Example 1:

 Input: s = "(()"
 Output: 2
 Explanation: The longest valid parentheses substring is "()".
 Example 2:

 Input: s = ")()())"
 Output: 4
 Explanation: The longest valid parentheses substring is "()()".
 Example 3:

 Input: s = ""
 Output: 0
  

 Constraints:

 0 <= s.length <= 3 * 104
 s[i] is '(', or ')'.

*/

func longestValidParentheses(_ s: String) -> Int {
    var left = 0
    var right = 0
    var maxLength = 0
    for ch in s {
        if ch == ")" {
            right += 1
        } else {
            left += 1
        }
        if right > left {
            right = 0
            left = 0
        }
        if left == right {
            maxLength = max(maxLength, 2*left)
        }
    }
    left = 0
    right = 0
    for ch in s.reversed() {
        if ch == ")" {
            right += 1
        } else {
            left += 1
        }
        if left > right {
            right = 0
            left = 0
        }
        if left == right {
            maxLength = max(maxLength, 2*left)
        }
    }
    return maxLength
}
