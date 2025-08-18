//
//  sudokuSolver-37.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/23/25.
/*
 https://leetcode.com/problems/sudoku-solver/description/?envType=company&envId=yahoo&favoriteSlug=yahoo-more-than-six-months
 
 Write a program to solve a Sudoku puzzle by filling the empty cells.

 A sudoku solution must satisfy all of the following rules:

 Each of the digits 1-9 must occur exactly once in each row.
 Each of the digits 1-9 must occur exactly once in each column.
 Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
 The '.' character indicates empty cells.

  

 Example 1:


 Input: board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
 Output: [["5","3","4","6","7","8","9","1","2"],["6","7","2","1","9","5","3","4","8"],["1","9","8","3","4","2","5","6","7"],["8","5","9","7","6","1","4","2","3"],["4","2","6","8","5","3","7","9","1"],["7","1","3","9","2","4","8","5","6"],["9","6","1","5","3","7","2","8","4"],["2","8","7","4","1","9","6","3","5"],["3","4","5","2","8","6","1","7","9"]]
 Explanation: The input board is shown above and the only valid solution is shown below:


  

 Constraints:

 board.length == 9
 board[i].length == 9
 board[i][j] is a digit or '.'.
 It is guaranteed that the input board has only one solution.

 */

func solveSudoku(_ board: inout [[Character]]) {
    solve123(&board)
}

func solve123(_ board: inout [[Character]]) -> Bool {
    for i in 0..<9 {
        for j in 0..<9 {
            if board[i][j] == "." {
                for num in "123456789" {
                    if isValid(board, i, j, num) {
                        board[i][j] = num
                        if solve123(&board) {
                            return true
                        }
                        board[i][j] = "."
                    }
                }
                return false
            }
        }
    }
    return true
    
    func isValid(_ board: [[Character]], _ row: Int, _ col: Int, _ num: Character) -> Bool {
        for i in 0..<9 {
            if board[row][i] == num || board[i][col] == num ||
                board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] == num {
                return false
            }
        }
        return true
    }
}
