//
//  generateParanthesis.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/20/25.
/*
 https://leetcode.com/problems/generate-parentheses/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

  

 Example 1:

 Input: n = 3
 Output: ["((()))","(()())","(())()","()(())","()()()"]
 Example 2:

 Input: n = 1
 Output: ["()"]
  

 Constraints:

 1 <= n <= 8
 */

func generateParenthesis(_ n: Int) -> [String] {
    var ans = [String]()
    func solve(_ open:Int
               ,_ close: Int,
               _ result: String) {
        if result.count == n*2 {
            ans.append(result)
            return
        }
        if open > 0 {
            solve(open-1, close  , result + "(")
        }
        if close > open {
            solve(open, close-1  , result + ")")
        }
    }
    solve(n, n, "")
    return ans
}


