//
//  N-Queens-2-52.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/27/25.
/*
 https://leetcode.com/problems/n-queens-ii/description/
 
 The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.

 Given an integer n, return the number of distinct solutions to the n-queens puzzle.

  

 Example 1:


 Input: n = 4
 Output: 2
 Explanation: There are two distinct solutions to the 4-queens puzzle as shown.
 Example 2:

 Input: n = 1
 Output: 1
  

 Constraints:

 1 <= n <= 9
 */

func totalNQueens(_ n: Int) -> Int {
    
    var cols = Set<Int>()
    var posDiagonal = Set<Int>()
    var negDiagonal = Set<Int>()
    var res = 0
    var board : [[String]] = Array(repeating: Array(repeating: ".", count: n), count: n)
    
    func backtrack(_ r : Int) {
        if r == n {
            res += 1
            return
        }
        
        
        for c in 0..<n {
            if cols.contains(c) || posDiagonal.contains(r+c) || negDiagonal.contains(r-c) {
                continue
            }
            
            cols.insert(c)
            posDiagonal.insert(r+c)
            negDiagonal.insert(r-c)
            board[r][c] = "Q"
            backtrack(r+1)
            
            cols.remove(c)
            posDiagonal.remove(r+c)
            negDiagonal.remove(r-c)
            board[r][c] = "."
        }
    }
    backtrack(0)
    return res
}
