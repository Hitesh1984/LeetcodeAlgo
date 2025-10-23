//
//  TrappingRainWater-2-407.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/15/25.
/*
 https://leetcode.com/problems/trapping-rain-water-ii/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an m x n integer matrix heightMap representing the height of each unit cell in a 2D elevation map, return the volume of water it can trap after raining.

  

 Example 1:


 Input: heightMap = [[1,4,3,1,3,2],[3,2,1,3,2,4],[2,3,3,2,3,1]]
 Output: 4
 Explanation: After the rain, water is trapped between the blocks.
 We have two small ponds 1 and 3 units trapped.
 The total volume of water trapped is 4.
 Example 2:


 Input: heightMap = [[3,3,3,3,3],[3,2,2,2,3],[3,2,1,2,3],[3,2,2,2,3],[3,3,3,3,3]]
 Output: 10
  

 Constraints:

 m == heightMap.length
 n == heightMap[i].length
 1 <= m, n <= 200
 0 <= heightMap[i][j] <= 2 * 104

 */
import Collections
import Algorithms

struct Cell:Comparable {
    let row: Int
    let col: Int
    let height: Int
    static func <(l:Self,r:Self)->Bool {l.height < r.height}
}

func trapRainWater(_ map: [[Int]]) -> Int {
    let m = map.count
    guard m > 0 else { return 0 }
    let n = map[0].count
    guard n > 0 else { return 0 }
    
    var visited = Array(repeating: Array(repeating: false, count: n), count: m)
    var pq = Heap<Cell>()
    var result = 0
    for i in 0..<m {
        for j in 0..<n {
            if i == 0 || i == m - 1 || j == 0 || j == n - 1 {
                pq.insert(Cell(row: i, col: j, height: map[i][j]))
                visited[i][j] = true
            }
        }
    }
    let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    while let cell = pq.popMin(){
        for dir in directions {
            let nR = cell.row + dir.0
            let nC = cell.col + dir.1
            if nR >= 0 && nR < m && nC >= 0 && nC < n && !visited[nR][nC] {
                let nH = map[nR][nC]
                visited[nR][nC] = true
                if nH < cell.height {
                    result += cell.height - nH
                }
                pq.insert(Cell(row: nR, col: nC, height: max(nH, cell.height)))
            }
        }
    }
    return result
}
