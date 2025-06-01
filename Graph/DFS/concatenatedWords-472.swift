//
//  concatenatedWords-472.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/31/25.
/*
 https://leetcode.com/problems/concatenated-words/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an array of strings words (without duplicates), return all the concatenated words in the given list of words.

 A concatenated word is defined as a string that is comprised entirely of at least two shorter words (not necessarily distinct) in the given array.

  

 Example 1:

 Input: words = ["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]
 Output: ["catsdogcats","dogcatsdog","ratcatdogcat"]
 Explanation: "catsdogcats" can be concatenated by "cats", "dog" and "cats";
 "dogcatsdog" can be concatenated by "dog", "cats" and "dog";
 "ratcatdogcat" can be concatenated by "rat", "cat", "dog" and "cat".
 Example 2:

 Input: words = ["cat","dog","catdog"]
 Output: ["catdog"]
  

 Constraints:

 1 <= words.length <= 104
 1 <= words[i].length <= 30
 words[i] consists of only lowercase English letters.
 All the strings of words are unique.
 1 <= sum(words[i].length) <= 105
 */

func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
    var set = Set<String>()
    words.map { set.insert($0) }
    var result = [String]()
    var cache = [String: Bool]()
    
    func checkConcatenated(_ word: String) -> Bool {
        if cache[word, default: false] {
            return true
        }
        for i in 1..<word.count {
            let prefix = String(word[..<word.index(word.startIndex, offsetBy: i)])
            let suffix = String(word[word.index(word.startIndex, offsetBy: i)...])
            if set.contains(suffix) && (set.contains(prefix) || checkConcatenated(prefix)) {
                cache[word] = true
                return true
            }
        }
        cache[word] = false
        return false
    }
    
    words.map { if checkConcatenated($0) { result.append($0) } }
    return result
}
