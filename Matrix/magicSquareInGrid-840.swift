//
//  magicSquareInGrid-840.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/28/25.
/*
 https://leetcode.com/problems/magic-squares-in-grid/description/?envType=problem-list-v2&envId=math
 
 A 3 x 3 magic square is a 3 x 3 grid filled with distinct numbers from 1 to 9 such that each row, column, and both diagonals all have the same sum.

 Given a row x col grid of integers, how many 3 x 3 magic square subgrids are there?

 Note: while a magic square can only contain numbers from 1 to 9, grid may contain numbers up to 15.

  

 Example 1:


 Input: grid = [[4,3,8,4],[9,5,1,9],[2,7,6,2]]
 Output: 1
 Explanation:
 The following subgrid is a 3 x 3 magic square:

 while this one is not:

 In total, there is only one magic square inside the given grid.
 Example 2:

 Input: grid = [[8]]
 Output: 0
  

 Constraints:

 row == grid.length
 col == grid[i].length
 1 <= row, col <= 10
 0 <= grid[i][j] <= 15

 */

func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
    // Ensure grid has at least 3x3 size
    guard grid.count >= 3, grid[0].count >= 3 else {
        return 0
    }
    
    // Helper function to check if a 3x3 grid is a magic square
    func isMagic(_ r: Int, _ c: Int) -> Bool {
        // Ensure we're working with a 3x3 subgrid
        guard r + 2 < grid.count, c + 2 < grid[0].count else {
            return false
        }
        
        // Check if the 3x3 grid contains distinct numbers from 1 to 9
        let s = Set([grid[r][c], grid[r][c+1], grid[r][c+2],
                     grid[r+1][c], grid[r+1][c+1], grid[r+1][c+2],
                     grid[r+2][c], grid[r+2][c+1], grid[r+2][c+2]])
        
        // If the set does not contain exactly numbers 1 through 9, it's not a magic square
        if s != Set(1...9) {
            return false
        }
        
        // Calculate the sum of each row
        let rowSum1 = grid[r][c] + grid[r][c+1] + grid[r][c+2]
        let rowSum2 = grid[r+1][c] + grid[r+1][c+1] + grid[r+1][c+2]
        let rowSum3 = grid[r+2][c] + grid[r+2][c+1] + grid[r+2][c+2]
        
        // Calculate the sum of each column
        let colSum1 = grid[r][c] + grid[r+1][c] + grid[r+2][c]
        let colSum2 = grid[r][c+1] + grid[r+1][c+1] + grid[r+2][c+1]
        let colSum3 = grid[r][c+2] + grid[r+1][c+2] + grid[r+2][c+2]
        
        // Calculate the sum of the two diagonals
        let diagSum1 = grid[r][c] + grid[r+1][c+1] + grid[r+2][c+2]
        let diagSum2 = grid[r][c+2] + grid[r+1][c+1] + grid[r+2][c]
        
        // Check if all rows, columns, and diagonals have the same sum (which should be 15 for a 3x3 magic square)
        return rowSum1 == 15 && rowSum2 == 15 && rowSum3 == 15 &&
        colSum1 == 15 && colSum2 == 15 && colSum3 == 15 &&
        diagSum1 == 15 && diagSum2 == 15
    }
    
    var count = 0
    
    // Iterate through the grid, checking each possible 3x3 subgrid
    for r in 0..<(grid.count - 2) {
        for c in 0..<(grid[0].count - 2) {
            // Check if the current 3x3 subgrid is a magic square
            if isMagic(r, c) {
                count += 1
            }
        }
    }
    
    // Return the total number of 3x3 magic squares found
    return count
}
