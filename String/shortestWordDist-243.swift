//
//  shortestWordDist-243.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/30/25.
/*
 https://leetcode.com/problems/shortest-word-distance/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an array of strings wordsDict and two different strings that already exist in the array word1 and word2, return the shortest distance between these two words in the list.

  

 Example 1:

 Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "coding", word2 = "practice"
 Output: 3
 Example 2:

 Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "makes", word2 = "coding"
 Output: 1
  

 Constraints:

 2 <= wordsDict.length <= 3 * 104
 1 <= wordsDict[i].length <= 10
 wordsDict[i] consists of lowercase English letters.
 word1 and word2 are in wordsDict.
 word1 != word2
 */

func shortestDistance(_ wordsDict: [String], _ word1: String, _ word2: String) -> Int {
    var index1 = -1
    var index2 = -1
    var minDistance = Int.max
    
    for (i, word) in wordsDict.enumerated() {
        if word == word1 {
            index1 = i
        } else if word == word2 {
            index2 = i
        }
        
        if index1 != -1 && index2 != -1 {
            minDistance = min(minDistance, abs(index1 - index2))
        }
    }
    
    return minDistance
}
