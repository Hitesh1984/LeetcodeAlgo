//
//  removeInvalidParanthesis-301.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/10/25.
/*
 https://leetcode.com/problems/remove-invalid-parentheses/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given a string s that contains parentheses and letters, remove the minimum number of invalid parentheses to make the input string valid.

 Return a list of unique strings that are valid with the minimum number of removals. You may return the answer in any order.

  

 Example 1:

 Input: s = "()())()"
 Output: ["(())()","()()()"]
 Example 2:

 Input: s = "(a)())()"
 Output: ["(a())()","(a)()()"]
 Example 3:

 Input: s = ")("
 Output: [""]
  

 Constraints:

 1 <= s.length <= 25
 s consists of lowercase English letters and parentheses '(' and ')'.
 There will be at most 20 parentheses in s.
*/

func removeInvalidParentheses(_ s: String) -> [String] {
    var queue = [String]()
    var visited = Set<String>()
    var result = [String]()
    var found = false
    queue.append(s)
    visited.insert(s)
    
    while !queue.isEmpty {
        let curr = queue.removeFirst()
        if isValid2(curr) {
            result.append(curr)
            found = true
        }
        if found { continue }
        for i in curr.indices {
            let c = curr[i]
            if c != "(" && c != ")" {
                continue
            }
            let next = String(curr[..<i]) + String(curr[curr.index(after: i)...])
            if !visited.contains(next) {
                queue.append(next)
                visited.insert(next)
            }
        }
    }
    return result
}

func isValid2(_ s: String) -> Bool {
    var count = 0
    for c in s {
        if c == "(" {
            count += 1
        } else if c == ")" {
            count -= 1
            if count < 0 {
                return false
            }
        }
    }
    return count == 0
}
