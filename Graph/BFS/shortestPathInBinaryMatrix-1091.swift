//
//  shortestPathInBinaryMatrix-1091.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/14/25.
//

/*
 https://leetcode.com/problems/shortest-path-in-binary-matrix/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an n x n binary matrix grid, return the length of the shortest clear path in the matrix. If there is no clear path, return -1.

 A clear path in a binary matrix is a path from the top-left cell (i.e., (0, 0)) to the bottom-right cell (i.e., (n - 1, n - 1)) such that:

 All the visited cells of the path are 0.
 All the adjacent cells of the path are 8-directionally connected (i.e., they are different and they share an edge or a corner).
 The length of a clear path is the number of visited cells of this path.

  

 Example 1:


 Input: grid = [[0,1],[1,0]]
 Output: 2
 Example 2:


 Input: grid = [[0,0,0],[1,1,0],[1,1,0]]
 Output: 4
 Example 3:

 Input: grid = [[1,0,0],[1,1,0],[1,1,0]]
 Output: -1
  

 Constraints:

 n == grid.length
 n == grid[i].length
 1 <= n <= 100
 grid[i][j] is 0 or 1
 */

func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
    var grid = grid
    let n = grid.count
    
    func isValid(_ x: Int, _ y: Int) -> Bool {
        x >= 0 && x < n && y >= 0 && y < n && grid[x][y] == 0
    }
    
    if grid[0][0] == 1 || grid[n-1][n-1] == 1 { return -1 }
    var queue: [[Int]] = [[0, 0]]
    let paths = [[0, 1],[0, -1],[1, 0],[-1, 0], [1, -1],[1, 1],[-1, 1],[-1, -1]]
    var level = 1
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let item = queue.removeFirst()
            let x = item[0]
            let y = item[1]
            let visited = grid[x][y]
            if x == n - 1 && y == n - 1 {
                return level
            } else {
                for path in paths {
                    let x = x + path[0]
                    let y = y + path[1]
                    if isValid(x, y) {
                        grid[x][y] = 1
                        queue.append([x, y])
                    }
                }
            }
        }
        level += 1
    }
    return -1
}
