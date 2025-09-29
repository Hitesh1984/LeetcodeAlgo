//
//  palindromePartitioning-131.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/11/25.
/*
 
 https://leetcode.com/problems/palindrome-partitioning/description/?envType=problem-list-v2&envId=dynamic-programming
 
 Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.

  

 Example 1:

 Input: s = "aab"
 Output: [["a","a","b"],["aa","b"]]
 Example 2:

 Input: s = "a"
 Output: [["a"]]
  

 Constraints:

 1 <= s.length <= 16
 s contains only lowercase English letters.

 */

func partition(_ s: String) -> [[String]] {
    let n = s.count
    var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var ans = [[String]]()
    var currentList = [String]()
    let str = Array(s)
    
    func dfs( start: Int) {
        guard start < n else { ans.append(currentList); return }
        
        for end in start..<n {
            guard str[start] == str[end], (end - start <= 2 || dp[start + 1][end - 1]) else { continue }
            dp[start][end] = true
            currentList.append(String(str[start...end]))
            dfs(start: end + 1 )
            currentList.removeLast()
        }
    }
    
    dfs(start:0)
    return ans
}
