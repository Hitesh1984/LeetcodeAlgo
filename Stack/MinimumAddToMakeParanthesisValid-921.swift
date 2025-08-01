//
//  MinimumAddToMakeParanthesisValid-921.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/16/25.
/*
 https://leetcode.com/problems/minimum-add-to-make-parentheses-valid/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 A parentheses string is valid if and only if:

 It is the empty string,
 It can be written as AB (A concatenated with B), where A and B are valid strings, or
 It can be written as (A), where A is a valid string.
 You are given a parentheses string s. In one move, you can insert a parenthesis at any position of the string.

 For example, if s = "()))", you can insert an opening parenthesis to be "(()))" or a closing parenthesis to be "())))".
 Return the minimum number of moves required to make s valid.

  

 Example 1:

 Input: s = "())"
 Output: 1
 Example 2:

 Input: s = "((("
 Output: 3
  

 Constraints:

 1 <= s.length <= 1000
 s[i] is either '(' or ')'.
 */

func minAddToMakeValid(_ s: String) -> Int {
    var stack = [Character]()
    var needs = 0
    for ch in s {
        if ch == "(" {
            stack.append(ch)
        } else {
            if stack.isEmpty {
                needs += 1
            } else {
                stack.removeLast()
            }
        }
    }
    return needs + stack.count
}
