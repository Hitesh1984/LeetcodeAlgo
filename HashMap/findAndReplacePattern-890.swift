//
//  findAndReplacePattern-890.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/17/25.
/*
 https://leetcode.com/problems/find-and-replace-pattern/?envType=problem-list-v2&envId=hash-table
 
 Given a list of strings words and a string pattern, return a list of words[i] that match pattern. You may return the answer in any order.

 A word matches the pattern if there exists a permutation of letters p so that after replacing every letter x in the pattern with p(x), we get the desired word.

 Recall that a permutation of letters is a bijection from letters to letters: every letter maps to another letter, and no two letters map to the same letter.

  

 Example 1:

 Input: words = ["abc","deq","mee","aqq","dkd","ccc"], pattern = "abb"
 Output: ["mee","aqq"]
 Explanation: "mee" matches the pattern because there is a permutation {a -> m, b -> e, ...}.
 "ccc" does not match the pattern because {a -> c, b -> c, ...} is not a permutation, since a and b map to the same letter.
 Example 2:

 Input: words = ["a","b","c"], pattern = "a"
 Output: ["a","b","c"]
  

 Constraints:

 1 <= pattern.length <= 20
 1 <= words.length <= 50
 words[i].length == pattern.length
 pattern and words[i] are lowercase English letters.
  
 */


func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
    func wordToArr(_ word: String) -> [Int]{
        var dict = [Character: Int]()
        var arr = [Int]()
        var i = 1
        for c in word {
            if dict[c, default: 0] > 0 {
                arr.append(dict[c, default: 0]) // 1,2,2
            } else{
                arr.append(i) // [1, 2, ]
                dict[c, default: 0] = i // a= 1, b= 1
                i += 1 // 3
            }
        }
        return arr
    }
    var arr_pat = wordToArr(pattern)
    var ans = [String]()
    for word in words{
        if wordToArr(word) == arr_pat{
            ans.append(word)
        }
    }
    return ans
}
