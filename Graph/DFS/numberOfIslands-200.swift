//
//  numberOfIslands.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/30/25.
//

/*
 
 https://leetcode.com/problems/number-of-islands/description/?envType=company&envId=amazon&favoriteSlug=amazon-six-months
 
 Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

 An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

  

 Example 1:

 Input: grid = [
   ["1","1","1","1","0"],
   ["1","1","0","1","0"],
   ["1","1","0","0","0"],
   ["0","0","0","0","0"]
 ]
 Output: 1
 Example 2:

 Input: grid = [
   ["1","1","0","0","0"],
   ["1","1","0","0","0"],
   ["0","0","1","0","0"],
   ["0","0","0","1","1"]
 ]
 Output: 3
  

 Constraints:

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 300
 grid[i][j] is '0' or '1'.
 */

import Foundation


func numIslands(_ grid: [[Character]]) -> Int {
    var result = 0
    var notGrid = grid
    for row in 0..<grid.count
    {
        for column in 0..<notGrid[row].count
        {
            if notGrid[row][column] == "1"
            {
                isLandSearchDFS(&notGrid, row, column)
                result += 1
            }
        }
    }
    
    
    return result
}
func isLandSearchDFS(_ grid:inout [[Character]], _ row:Int, _ column:Int)
{
    /* Validation */
    
    if row < 0 || row >= grid.count || column < 0 || column >= grid[row].count || grid[row][column] == "0"
    {
        return
    }
    grid[row][column] = "0"
    isLandSearchDFS(&grid, row-1, column)
    isLandSearchDFS(&grid, row+1, column)
    isLandSearchDFS(&grid, row, column-1)
    isLandSearchDFS(&grid, row, column+1)
}
