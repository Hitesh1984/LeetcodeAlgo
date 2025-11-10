//
//  minNumberOfValidStringToFormTarget-3291.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/8/25.
/*
 
 https://leetcode.com/problems/minimum-number-of-valid-strings-to-form-target-i/
 
 You are given an array of strings words and a string target.

 A string x is called valid if x is a prefix of any string in words.

 Return the minimum number of valid strings that can be concatenated to form target. If it is not possible to form target, return -1.

  

 Example 1:

 Input: words = ["abc","aaaaa","bcdef"], target = "aabcdabc"

 Output: 3

 Explanation:

 The target string can be formed by concatenating:

 Prefix of length 2 of words[1], i.e. "aa".
 Prefix of length 3 of words[2], i.e. "bcd".
 Prefix of length 3 of words[0], i.e. "abc".
 Example 2:

 Input: words = ["abababab","ab"], target = "ababaababa"

 Output: 2

 Explanation:

 The target string can be formed by concatenating:

 Prefix of length 5 of words[0], i.e. "ababa".
 Prefix of length 5 of words[0], i.e. "ababa".
 Example 3:

 Input: words = ["abcdef"], target = "xyz"

 Output: -1

  

 Constraints:

 1 <= words.length <= 100
 1 <= words[i].length <= 5 * 103
 The input is generated such that sum(words[i].length) <= 105.
 words[i] consists only of lowercase English letters.
 1 <= target.length <= 5 * 103
 target consists only of lowercase English letters.
  
 */

func minValidStrings(_ words: [String], _ target: String) -> Int {
    class TrieNode {
        var next = [Character: TrieNode]()
        func addWord(_ word:String) {
            var node = self
            for ch in word {
                node.next[ch] = node.next[ch] ?? TrieNode()
                node = node.next[ch]!
            }
        }
    }
    let trie = TrieNode()
    words.map { trie.addWord($0) }
    let target = Array(target)
    var dp = Array(repeating: Int.max, count: target.count+1)
    dp[0] = 0
    for i in dp.indices where dp[i] != .max {
        var node = trie
        for (j, ch) in target[i...].indexed() {
            guard let next = node.next[ch] else { break }
            node = next
            dp[j+1] = min(dp[j+1], dp[i]+1)
        }
    }
    return dp.last! == .max ? -1 : dp.last!
}
