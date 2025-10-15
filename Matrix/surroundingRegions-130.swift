//
//  surroundingRegions-130.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/16/25.
/*
 https://leetcode.com/problems/surrounded-regions/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 You are given an m x n matrix board containing letters 'X' and 'O', capture regions that are surrounded:

 Connect: A cell is connected to adjacent cells horizontally or vertically.
 Region: To form a region connect every 'O' cell.
 Surround: The region is surrounded with 'X' cells if you can connect the region with 'X' cells and none of the region cells are on the edge of the board.
 To capture a surrounded region, replace all 'O's with 'X's in-place within the original board. You do not need to return anything.

  

 Example 1:

 Input: board = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]

 Output: [["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]]

 Explanation:


 In the above diagram, the bottom region is not captured because it is on the edge of the board and cannot be surrounded.

 Example 2:

 Input: board = [["X"]]

 Output: [["X"]]

  

 Constraints:

 m == board.length
 n == board[i].length
 1 <= m, n <= 200
 board[i][j] is 'X' or 'O'.
 */

func solve(_ board: inout [[Character]]) {
    let ROWS = board.count
    let COLS = board[0].count
    
    func dfs( _ row:Int, _ col:Int) {
        if row < 0 || col < 0 || row == ROWS || col == COLS || board[row][col] != "O" {
            return
        }
        board[row][col] = "T"
        dfs(row+1, col)
        dfs(row-1, col)
        dfs(row, col+1)
        dfs(row, col-1)
    }
    for row in 0..<ROWS {
        for col in 0..<COLS where board[row][col] == "O" &&
        ( row == 0 || row == ROWS-1 || col == 0 || col == COLS-1 ) {
            dfs(row, col)
        }
    }
    for row in 0..<ROWS {
        for col in 0..<COLS where board[row][col] == "O"  {
            board[row][col] = "X"
        }
    }
    for row in 0..<ROWS {
        for col in 0..<COLS where board[row][col] == "T"  {
            board[row][col] = "O"
        }
    }
}
