//
//  validParenthesisString-678.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/26/25.
/*
 https://leetcode.com/problems/valid-parenthesis-string/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given a string s containing only three types of characters: '(', ')' and '*', return true if s is valid.

 The following rules define a valid string:

 Any left parenthesis '(' must have a corresponding right parenthesis ')'.
 Any right parenthesis ')' must have a corresponding left parenthesis '('.
 Left parenthesis '(' must go before the corresponding right parenthesis ')'.
 '*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string "".
  

 Example 1:

 Input: s = "()"
 Output: true
 Example 2:

 Input: s = "(*)"
 Output: true
 Example 3:

 Input: s = "(*))"
 Output: true
  

 Constraints:

 1 <= s.length <= 100
 s[i] is '(', ')' or '*'.

 */

func checkValidString(_ s: String) -> Bool {
    var left: [Int] = []
    var star: [Int] = []
    for (index,char) in s.enumerated() {
        if char == "(" {
            left.append(index)
        } else if char == ")" {
            if !left.isEmpty {
                left.removeLast()
            } else if !star.isEmpty {
                star.removeLast()
            } else {
                return false
            }
        } else {
            star.append(index)
        }
    }
    while !left.isEmpty, !star.isEmpty {
        let left = left.removeLast()
        let right = star.removeLast()
        if left > right {
            return false
        }
    }
    return left.isEmpty
}
