//
//  shortestBridge-934.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/6/25.
/*
 https://leetcode.com/problems/shortest-bridge/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 You are given an n x n binary matrix grid where 1 represents land and 0 represents water.

 An island is a 4-directionally connected group of 1's not connected to any other 1's. There are exactly two islands in grid.

 You may change 0's to 1's to connect the two islands to form one island.

 Return the smallest number of 0's you must flip to connect the two islands.

  

 Example 1:

 Input: grid = [[0,1],[1,0]]
 Output: 1
 Example 2:

 Input: grid = [[0,1,0],[0,0,0],[0,0,1]]
 Output: 2
 Example 3:

 Input: grid = [[1,1,1,1,1],[1,0,0,0,1],[1,0,1,0,1],[1,0,0,0,1],[1,1,1,1,1]]
 Output: 1
  

 Constraints:

 n == grid.length == grid[i].length
 2 <= n <= 100
 grid[i][j] is either 0 or 1.
 There are exactly two islands in grid.

 */

func shortestBridge(_ grid: [[Int]]) -> Int {
    let directions = [(1, 0), (0, 1), (-1, 0), (0, -1)]
    var steps = 0
    var grid = grid
    var queue = [(Int, Int)]()
    let count = grid.count // since its n*n matrix, so row and col will be same
    
    func dfs(_ x: Int, _ y: Int) {
        guard 0..<count ~= x, 0..<count ~= y, grid[x][y] == 1 else { return }
        grid[x][y] = 2
        queue.append((x, y))
        for dir in directions { dfs(x + dir.0, y + dir.1) }
    }
    
    mainLoop : for i in 0..<count {
        for j in 0..<count where grid[i][j] == 1 {
            dfs(i, j)
            break mainLoop
        }
    }
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let (x, y) = queue.removeFirst()
            for dir in directions {
                let newX = x + dir.0
                let newY = y + dir.1
                if 0..<count ~= newX, 0..<count ~= newY {
                    if grid[newX][newY] == 1 {
                        return steps
                    } else if grid[newX][newY] == 0 {
                        grid[newX][newY] = 2
                        queue.append((newX, newY))
                    }
                }
            }
        }
        steps += 1
    }
    return -1
}
