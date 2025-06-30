//
//  minRemoveToMakeValidParanthesis-1249.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/16/25.
/*
 https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given a string s of '(' , ')' and lowercase English characters.

 Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.

 Formally, a parentheses string is valid if and only if:

 It is the empty string, contains only lowercase characters, or
 It can be written as AB (A concatenated with B), where A and B are valid strings, or
 It can be written as (A), where A is a valid string.
  

 Example 1:

 Input: s = "lee(t(c)o)de)"
 Output: "lee(t(c)o)de"
 Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.
 Example 2:

 Input: s = "a)b(c)d"
 Output: "ab(c)d"
 Example 3:

 Input: s = "))(("
 Output: ""
 Explanation: An empty string is also valid.
  

 Constraints:

 1 <= s.length <= 105
 s[i] is either '(' , ')', or lowercase English letter.

 */

func minRemoveToMakeValid(_ s: String) -> String {
    let arr = Array(s)
    let n = arr.count
    var invalidIndices = Set<Int>()
    var stack = [Int]()
    for i in 0..<n {
        let c = arr[i]
        switch c {
        case "(": stack.append(i)
        case ")":
            if stack.isEmpty {
                invalidIndices.insert(i)
            } else {
                stack.popLast()
            }
        default: break
        }
    }
    invalidIndices.formUnion(stack)
    var res = ""
    for i in 0..<n where !invalidIndices.contains(i) {
        res.append(arr[i])
    }
    return res
}
