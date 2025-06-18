//
//  maxAreaofIsland-695.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/5/25.

/*
 https://leetcode.com/problems/max-area-of-island/description/?envType=company&envId=amazon&favoriteSlug=amazon-six-months
 
 You are given an m x n binary matrix grid. An island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

 The area of an island is the number of cells with a value 1 in the island.

 Return the maximum area of an island in grid. If there is no island, return 0.

  

 Example 1:


 Input: grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
 Output: 6
 Explanation: The answer is not 11, because the island must be connected 4-directionally.
 Example 2:

 Input: grid = [[0,0,0,0,0,0,0,0]]
 Output: 0
  

 Constraints:

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 50
 grid[i][j] is either 0 or 1.

 */

func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    var rows = grid.count, cols = grid[0].count
    var maxArea = 0
    var gridM = grid
    for row in 0..<rows {
        for col in 0..<cols {
            maxArea = max(maxArea, dfSearch(row, col))
        }
    }
    func dfSearch(_ row: Int, _ col: Int) -> Int {
        guard row >= 0, col >= 0, row < rows, col < cols, gridM[row][col] == 1 else { return 0 }
        gridM[row][col] = 0
        return dfSearch(row + 1, col) + dfSearch(row, col + 1) + dfSearch(row - 1, col) + dfSearch(row, col - 1) + 1
    }
    return maxArea
}
