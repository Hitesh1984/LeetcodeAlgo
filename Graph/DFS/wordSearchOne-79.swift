//
//  wordSearchOne.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 2/17/25.
//
/*
 https://leetcode.com/problems/word-search/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an m x n grid of characters board and a string word, return true if word exists in the grid.

 The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

  

 Example 1:


 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
 Output: true
 Example 2:


 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
 Output: true
 Example 3:


 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
 Output: false
  

 Constraints:

 m == board.length
 n = board[i].length
 1 <= m, n <= 6
 1 <= word.length <= 15
 board and word consists of only lowercase and uppercase English letters.
  

 Follow up: Could you use search pruning to make your solution faster with a larger board?
 */

import Foundation

func exist(_ board: [[Character]], _ word: String) -> Bool {
    
    guard !board.isEmpty, !word.isEmpty else {return false}
    let word = Array(word)
    var board = board
    func doesWordExist(  i:Int, j:Int, wordIndex : Int) -> Bool{
        if wordIndex == word.count{
            return true
        }
        guard i >= 0 , i < board.count , j >= 0 ,
              j < board[0].count ,
              board[i][j] == word[wordIndex] else {return false}
        board[i][j] = "x"
        let result = doesWordExist(i: i+1, j: j, wordIndex: wordIndex+1) ||
        doesWordExist(i: i-1, j: j, wordIndex: wordIndex+1) ||
        doesWordExist(i: i, j: j+1, wordIndex: wordIndex+1) ||
        doesWordExist(i: i, j: j-1, wordIndex: wordIndex+1)
        board[i][j] = word[wordIndex]
        return result
    }
    for i in 0..<board.count{
        for j in 0..<board[i].count{
            if board[i][j] == word[0] {
                if doesWordExist(i:i, j:j, wordIndex : 0){ return true }
            }
        }
    }
    return false
}

func wordExistInMatrix( board: Matrix<Character>, word:String) -> Bool {
    
    let rows = board.rows
    let cols = board.columns
    var visit:Matrix<Bool> = Matrix(rows: rows, columns: cols, defaultValue: false)
    func dfs(row:Int, col:Int, index:Int) -> Bool {
        if index == word.count {
            return true
        }
        if row < 0 || col < 0 || row >= rows || col >= cols  {
            return false
        }
        let character  = word[index]
        if !visit.indexIsValid(row: row, column: col) ||
            visit[row,col] == true ||
            character != String(board[row,col]) {
            return false
        }
        visit[row,col] = true
        let result = (dfs(row: row+1, col: col, index: index+1) ||
                      dfs(row: row-1, col: col, index: index+1) ||
                      dfs(row: row, col: col+1, index: index+1) ||
                      dfs(row: row, col: col-1, index: index+1))
        visit[row,col] = false
        return result
    }
    
    for r in Range(0...rows-1) {
        for c in Range(0...cols-1) {
            if dfs(row: r, col: c, index: 0){
                return true
            }
        }
    }
    return false
}

