//
//  wordLadderLength.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 2/6/25.
//

import Foundation

/*
 https://leetcode.com/problems/word-ladder/description/
 
 A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that:

 Every adjacent pair of words differs by a single letter.
 Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
 sk == endWord
 Given two words, beginWord and endWord, and a dictionary wordList, return the number of words in the shortest transformation sequence from beginWord to endWord, or 0 if no such sequence exists.

  

 Example 1:

 Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
 Output: 5
 Explanation: One shortest transformation sequence is "hit" -> "hot" -> "dot" -> "dog" -> cog", which is 5 words long.
 Example 2:

 Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
 Output: 0
 Explanation: The endWord "cog" is not in wordList, therefore there is no valid transformation sequence.
  

 Constraints:

 1 <= beginWord.length <= 10
 endWord.length == beginWord.length
 1 <= wordList.length <= 5000
 wordList[i].length == beginWord.length
 beginWord, endWord, and wordList[i] consist of lowercase English letters.
 beginWord != endWord
 All the words in wordList are unique.
 */

private let alphabet = "abcdefghijklmnopqrstuvwxyz"

func ladderLength3(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    guard beginWord.count == endWord.count else { return 0 }
    
    var words = Set<String>(wordList)
    var queue: [(String, Int)] = [(beginWord, 1)]
    while !queue.isEmpty {
        let (word, step) = queue.removeFirst()
        guard word != endWord else { return step }
        
        for i in 0..<word.count {
            var chars = Array(word)
            for ch in alphabet where ch != chars[i] {
                chars[i] = ch
                let modified = String(chars)
                guard words.contains(modified) else { continue }
                words.remove(modified)
                queue.append((modified, step + 1))
            }
        }
    }
    return 0
}




func ladderLength5(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int
{
    if !wordList.contains(endWord) {
        return 0
    }
    var wordList = wordList
    var nei = [String:[String]]()
    if !wordList.contains(beginWord) {
        wordList.append(beginWord)
    }
    for word in wordList {
        for j in stride (from: 0, to: word.count, by: 1) {
            let pattern = word.substring(toIndex: j) + "*" + word.substring(fromIndex: j+1)
            if nei.keys.contains(pattern) {
                nei[pattern]?.append(word)
            } else {
                nei[pattern] = [word]
            }
        }
    }
    var visit = [String]()
    var queue = [String]()
    visit.append(beginWord)
    queue.append(beginWord)
    var res = 1
    while !queue.isEmpty
    {
        let queueCount = queue.count
        for iteration in stride(from: 0, through: queueCount-1, by: 1) {
            let word = queue.removeFirst() //else { return 0 }
            if word == endWord {
                return res
            }
            for j in stride(from: 0, to: word.count, by: 1) {
                let pattern = word.substring(toIndex: j) + "*" + word.substring(fromIndex: j+1)
                guard let neiPatternList = nei[pattern], neiPatternList.count > 0  else { continue }
                for index in stride(from: 0, through: neiPatternList.count-1, by: 1)
                {
                    let neiWord = neiPatternList[index]
                    if !visit.contains(neiWord) {
                        visit.append(neiWord)
                        queue.append(neiWord)
                    }
                }
            }
        }
        res = res + 1
    }
    return 0
}
