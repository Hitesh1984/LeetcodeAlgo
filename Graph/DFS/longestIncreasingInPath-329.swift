//
//  longestIncreasingInPath-329.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/13/25.
//
/*
 https://leetcode.com/problems/longest-increasing-path-in-a-matrix/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an m x n integers matrix, return the length of the longest increasing path in matrix.
 
 From each cell, you can either move in four directions: left, right, up, or down. You may not move diagonally or move outside the boundary (i.e., wrap-around is not allowed).
 
 
 
 Example 1:
 
 
 Input: matrix = [[9,9,4],[6,6,8],[2,1,1]]
 Output: 4
 Explanation: The longest increasing path is [1, 2, 6, 9].
 Example 2:
 
 
 Input: matrix = [[3,4,5],[3,2,6],[2,2,1]]
 Output: 4
 Explanation: The longest increasing path is [3, 4, 5, 6]. Moving diagonally is not allowed.
 Example 3:
 
 Input: matrix = [[1]]
 Output: 1
 
 
 Constraints:
 
 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 200
 0 <= matrix[i][j] <= 231 - 1
 */
import Foundation

func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
    let rows = matrix.count
    let cols = matrix[0].count
    
    var dp = [[Int]:Int]()
    
    func dfs(_ row:Int, _ col:Int,_ prev:Int) -> Int {
        if row < 0 || col < 0 || row == rows || col == cols || prev >= matrix[row][col] {
            return 0
        }
        if let val = dp[[row,col]] {
            return val
        }
        var res = 1
        
        res = max(res, 1 + dfs(row-1, col, matrix[row][col]))
        res = max(res, 1 + dfs(row+1, col, matrix[row][col]))
        res = max(res, 1 + dfs(row, col-1, matrix[row][col]))
        res = max(res, 1 + dfs(row, col+1, matrix[row][col]))
        
        dp[[row,col]] = res
        return res
    }
    
    for row in 0..<rows {
        for col in 0..<cols {
            dfs(row, col, -1)
        }
    }
    return dp.values.max()!
    
}
