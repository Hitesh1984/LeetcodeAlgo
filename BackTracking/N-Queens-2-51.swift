//
//  N-Queens-2-51.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/27/25.
/*
 https://leetcode.com/problems/n-queens/description/
 
 The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.

 Given an integer n, return all distinct solutions to the n-queens puzzle. You may return the answer in any order.

 Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space, respectively.

  

 Example 1:


 Input: n = 4
 Output: [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
 Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above
 Example 2:

 Input: n = 1
 Output: [["Q"]]
  

 Constraints:

 1 <= n <= 9
 */

func solveNQueens(_ n: Int) -> [[String]] {
    
    var cols = Set<Int>()
    var posDiagonal = Set<Int>()
    var negDiagonal = Set<Int>()
    var res = [[String]]()
    var board : [[String]] = Array(repeating: Array(repeating: ".", count: n), count: n)
    
    func backtrack(_ r : Int) {
        if r == n {
            res.append(board.map{ $0.joined() } )
            return
        }
        // if r == n {
        //     var ans = [String]()
        //     for row in 0..<board.count {
        //         var temp = ""
        //         for col in 0..<board[row].count {
        //             //temp += board[row][col]
        //             temp.append(board[row][col])
        //         }
        //         ans.append(temp)
        //     }
        //     res.append(ans)
        //     return
        // }
        
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
