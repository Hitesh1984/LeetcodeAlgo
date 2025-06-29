//
//  wordLadder-2-126.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/25/25.
/*
 https://leetcode.com/problems/word-ladder-ii/description/
 
 A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that:

 Every adjacent pair of words differs by a single letter.
 Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
 sk == endWord
 Given two words, beginWord and endWord, and a dictionary wordList, return all the shortest transformation sequences from beginWord to endWord, or an empty list if no such sequence exists. Each sequence should be returned as a list of the words [beginWord, s1, s2, ..., sk].

  

 Example 1:

 Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
 Output: [["hit","hot","dot","dog","cog"],["hit","hot","lot","log","cog"]]
 Explanation: There are 2 shortest transformation sequences:
 "hit" -> "hot" -> "dot" -> "dog" -> "cog"
 "hit" -> "hot" -> "lot" -> "log" -> "cog"
 Example 2:

 Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
 Output: []
 Explanation: The endWord "cog" is not in wordList, therefore there is no valid transformation sequence.
  

 Constraints:

 1 <= beginWord.length <= 5
 endWord.length == beginWord.length
 1 <= wordList.length <= 500
 wordList[i].length == beginWord.length
 beginWord, endWord, and wordList[i] consist of lowercase English letters.
 beginWord != endWord
 All the words in wordList are unique.
 The sum of all shortest transformation sequences does not exceed 105.

 */

func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
    func adjacent(_ s1: String, _ s2: String) -> Bool {
        var match = false
        for (c1, c2) in zip(s1, s2) where c1 != c2 {
            if match { return false }
            match = true
        }
        return true
    }
    if !wordList.contains(endWord) { return [] }
    var wordList = wordList
    if !wordList.contains(beginWord) {
        wordList.append(beginWord)
    }
    let n = wordList.count
    var adj = Array(repeating: [Int](), count: n)
    for i in 0..<n {
        for j in i + 1..<n {
            if adjacent(wordList[i], wordList[j]) {
                adj[i].append(j)
                adj[j].append(i)
            }
        }
    }
    var dist = Array(repeating: Int.max, count: n)
    let start = wordList.firstIndex(of: beginWord)!
    let end = wordList.firstIndex(of: endWord)!
    dist[end] = 0
    for _ in 0..<n {
        for u in 0..<n {
            for v in adj[u] where dist[u] != Int.max {
                dist[v] = min(dist[v], dist[u] + 1)
            }
        }
    }
    if dist[start] == Int.max { return [] }
    var paths = [[start]]
    for _ in 1...dist[start] {
        var newPaths = [[Int]]()
        for path in paths {
            let u = path.last!
            for v in adj[u] where dist[v] == dist[u] - 1 {
                newPaths.append(path + [v])
            }
        }
        paths = newPaths
    }
    var res = [[String]]()
    for path in paths {
        res.append(path.map { wordList[$0] })
    }
    return res
}
