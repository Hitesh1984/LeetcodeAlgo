//
//  rotatingOranges-994.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/15/25.

/*
 https://leetcode.com/problems/rotting-oranges/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 You are given an m x n grid where each cell can have one of three values:

 0 representing an empty cell,
 1 representing a fresh orange, or
 2 representing a rotten orange.
 Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.

 Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.

  

 Example 1:


 Input: grid = [[2,1,1],[1,1,0],[0,1,1]]
 Output: 4
 Example 2:

 Input: grid = [[2,1,1],[0,1,1],[1,0,1]]
 Output: -1
 Explanation: The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.
 Example 3:

 Input: grid = [[0,2]]
 Output: 0
 Explanation: Since there are already no fresh oranges at minute 0, the answer is just 0.
  

 Constraints:

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 10
 grid[i][j] is 0, 1, or 2.
 */

// [[2,1,1],[1,1,0],[0,1,1]]
func orangesRotting(_ grid: [[Int]]) -> Int {
    var grid = grid
    var queue: Array<(Int, Int)> = []
    var rows = grid.count
    var cols = grid[0].count
    var mins = 0
    var fresh = 0
    for row in 0..<rows {
        for col in 0..<cols {
            if grid[row][col] == 2 {
                queue.append((row,col))
            } else if grid[row][col] == 1 {
                fresh += 1
            }
        }
    }
    let dir = [(0,1), (0,-1), (1,0), (-1,0)]
    while !queue.isEmpty && fresh > 0 {
        let cnt = queue.count
        for i in 0..<cnt {
            let (r,c) = queue.removeFirst()
            
            for (dr,dc) in dir {
                let nr = r + dr
                let nc = c + dc
                if nr < 0 || nr >= rows || nc < 0 || nc >= cols
                    || grid[nr][nc] != 1 {
                    continue
                }
                grid[nr][nc] = 2
                queue.append((nr,nc))
                fresh -= 1
            }
        }
        mins += 1
    }
    return fresh == 0 ? mins : -1
}
