//
//  UncommonWordsFromTwoSentences-884.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/17/25.
/*
 https://leetcode.com/problems/uncommon-words-from-two-sentences/description/?envType=problem-list-v2&envId=hash-table
 
 A sentence is a string of single-space separated words where each word consists only of lowercase letters.

 A word is uncommon if it appears exactly once in one of the sentences, and does not appear in the other sentence.

 Given two sentences s1 and s2, return a list of all the uncommon words. You may return the answer in any order.

  

 Example 1:

 Input: s1 = "this apple is sweet", s2 = "this apple is sour"

 Output: ["sweet","sour"]

 Explanation:

 The word "sweet" appears only in s1, while the word "sour" appears only in s2.

 Example 2:

 Input: s1 = "apple apple", s2 = "banana"

 Output: ["banana"]

  

 Constraints:

 1 <= s1.length, s2.length <= 200
 s1 and s2 consist of lowercase English letters and spaces.
 s1 and s2 do not have leading or trailing spaces.
 All the words in s1 and s2 are separated by a single space.
  
 */


func uncommonFromSentences(_ s1: String, _ s2: String) -> [String] {
    
    var ans = [String]()
    
    var arr1 = s1.split(separator: " ").map({String($0)})
    var arr2 = s2.split(separator: " ").map({String($0)})
    
    var set_s1: Set<String> = []
    var set_s2: Set<String> = []
    
    var dict1 = [String: Int]()
    var dict2 = [String: Int]()
    
    arr1.forEach({dict1[$0, default: 0] += 1; set_s1.insert($0)})
    arr2.forEach({dict2[$0, default: 0] += 1; set_s2.insert($0)})
    
    
    arr1.forEach({if !set_s2.contains($0) && dict1[$0, default: 0] == 1 {ans.append($0)}})
    arr2.forEach({if !set_s1.contains($0) && dict2[$0, default: 0] == 1 {ans.append($0)}})
    
    return ans
    
}
