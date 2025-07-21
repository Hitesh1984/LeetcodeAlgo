//
//  shortestDistFromAllBuildings-317.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/8/25.
/*
 https://leetcode.com/problems/shortest-distance-from-all-buildings/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 You are given an m x n grid grid of values 0, 1, or 2, where:

 each 0 marks an empty land that you can pass by freely,
 each 1 marks a building that you cannot pass through, and
 each 2 marks an obstacle that you cannot pass through.
 You want to build a house on an empty land that reaches all buildings in the shortest total travel distance. You can only move up, down, left, and right.

 Return the shortest travel distance for such a house. If it is not possible to build such a house according to the above rules, return -1.

 The total travel distance is the sum of the distances between the houses of the friends and the meeting point.

  

 Example 1:


 Input: grid = [[1,0,2,0,1],[0,0,0,0,0],[0,0,1,0,0]]
 Output: 7
 Explanation: Given three buildings at (0,0), (0,4), (2,2), and an obstacle at (0,2).
 The point (1,2) is an ideal empty land to build a house, as the total travel distance of 3+3+1=7 is minimal.
 So return 7.
 Example 2:

 Input: grid = [[1,0]]
 Output: 1
 Example 3:

 Input: grid = [[1]]
 Output: -1
  

 Constraints:

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 50
 grid[i][j] is either 0, 1, or 2.
 There will be at least one building in the grid.

 */


func shortestDistance(_ grid: [[Int]]) -> Int {
    if grid.count == 0 { return 0}
    let row = grid.count
    let col = grid[0].count
    var distance = Array(repeating:Array(repeating:0, count:col),count:row)
    var reach = Array(repeating:Array(repeating:0, count:col),count:row)
    var buildingNum = 0
    let directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    for i in 0..<row {
        for j in 0..<col  {
            if grid[i][j] != 1 { continue }
            buildingNum += 1
            var queue = [(i,j)]
            var visited = Array(repeating:Array(repeating:false, count:col),count:row)
            var step = 1
            while queue.count > 0 {
                let size = queue.count
                for _ in 0..<size {
                    let (x,y) = queue.removeFirst()
                    for dir in directions{
                        let nx = x + dir[0]
                        let ny = y + dir[1]
                        if nx < 0 || nx == row || ny < 0 || ny == col || visited[nx][ny] || grid[nx][ny] != 0 {
                            continue
                        }
                        distance[nx][ny] += step
                        reach[nx][ny] += 1
                        visited[nx][ny] = true
                        queue.append((nx,ny))
                    }
                }
                step += 1
            }
        }
    }
    
    var res = Int.max
    for i in 0..<row {
        for j in 0..<col {
            if grid[i][j] == 0 && reach[i][j] == buildingNum {
                res = min(res, distance[i][j])
            }
        }
    }
    return res == Int.max ? -1 : res
}
