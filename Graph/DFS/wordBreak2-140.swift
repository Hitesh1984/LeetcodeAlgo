//
//  wordBreak2-140.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/22/25.
/*
https://leetcode.com/problems/word-break-ii/?envType=company&envId=amazon&favoriteSlug=amazon-three-months

 Given a string s and a dictionary of strings wordDict, add spaces in s to construct a sentence where each word is a valid dictionary word. Return all such possible sentences in any order.

 Note that the same word in the dictionary may be reused multiple times in the segmentation.

  

 Example 1:

 Input: s = "catsanddog", wordDict = ["cat","cats","and","sand","dog"]
 Output: ["cats and dog","cat sand dog"]
 Example 2:

 Input: s = "pineapplepenapple", wordDict = ["apple","pen","applepen","pine","pineapple"]
 Output: ["pine apple pen apple","pineapple pen apple","pine applepen apple"]
 Explanation: Note that you are allowed to reuse a dictionary word.
 Example 3:

 Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
 Output: []
  

 Constraints:

 1 <= s.length <= 20
 1 <= wordDict.length <= 1000
 1 <= wordDict[i].length <= 10
 s and wordDict[i] consist of only lowercase English letters.
 All the strings of wordDict are unique.
 Input is generated in a way that the length of the answer doesn't exceed 105.
*/
func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
    var dict = [String: [String]]()
    func dfs(_ s: String) -> [String]
    {
        if let val = dict[s] { return val }
        guard !s.isEmpty else { return [""] }
        var ans = [String]()
        for word in wordDict {
            guard s.hasPrefix(word) else { continue }
            let sublist = dfs(String(s.dropFirst(word.count)))
            for sub in sublist {
                ans.append("\(word)\(sub.isEmpty ? "" : " ")\(sub)")
            }
        }
        dict[s] = ans
        return ans
    }
    return dfs(s)
}
