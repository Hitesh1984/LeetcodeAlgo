//
//  wordSearch-2-212.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/31/25.

/*
 https://leetcode.com/problems/word-search-ii/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an m x n board of characters and a list of strings words, return all words on the board.

 Each word must be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.

  

 Example 1:


 Input: board = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], words = ["oath","pea","eat","rain"]
 Output: ["eat","oath"]
 Example 2:


 Input: board = [["a","b"],["c","d"]], words = ["abcb"]
 Output: []
  

 Constraints:

 m == board.length
 n == board[i].length
 1 <= m, n <= 12
 board[i][j] is a lowercase English letter.
 1 <= words.length <= 3 * 104
 1 <= words[i].length <= 10
 words[i] consists of lowercase English letters.
 All the strings of words are unique.

 */

class TrieNode1 {
    var word: String?
    var children = [Character: TrieNode1]()
    
    func addWord(_ word:String) {
        var node = self
        for char in word {
            if node.children[char] == nil{
                node.children[char] = TrieNode1()
            }
            node = node.children[char]!
        }
        node.word = word
    }
}
class FindSearchSolution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        if board.isEmpty { return [] }
        var result = [String]()
        var board = board
        let root = TrieNode1()
        words.map { root.addWord($0) }
        var visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
        func check( _ i: Int, _ j: Int, _ node: TrieNode1) {
            if i < 0 || j < 0 || i >= board.count || j >= board[0].count { return }
            if visited[i][j] { return }
            guard let currNode = node.children[board[i][j]] else { return }
            if let word = currNode.word {
                result.append(word)
                currNode.word = nil
            }
            let char = board[i][j]
            board[i][j] = "0"
            visited[i][j] = true
            check( i - 1, j, currNode)
            check( i + 1, j, currNode)
            check( i, j - 1, currNode)
            check( i, j + 1, currNode)
            visited[i][j] = false
            board[i][j] = char
        }
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                check( i, j, root)
            }
        }
        return result
    }
}
