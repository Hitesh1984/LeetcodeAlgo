//
//  makingALargeIsland-827.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/23/25.
/*
 https://leetcode.com/problems/making-a-large-island/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 You are given an n x n binary matrix grid. You are allowed to change at most one 0 to be 1.

 Return the size of the largest island in grid after applying this operation.

 An island is a 4-directionally connected group of 1s.

  

 Example 1:

 Input: grid = [[1,0],[0,1]]
 Output: 3
 Explanation: Change one 0 to 1 and connect two 1s, then we get an island with area = 3.
 Example 2:

 Input: grid = [[1,1],[1,0]]
 Output: 4
 Explanation: Change the 0 to 1 and make the island bigger, only one island with area = 4.
 Example 3:

 Input: grid = [[1,1],[1,1]]
 Output: 4
 Explanation: Can't change any 0 to 1, only one island with area = 4.
  

 Constraints:

 n == grid.length
 n == grid[i].length
 1 <= n <= 500
 grid[i][j] is either 0 or 1.

 */



func largestIsland(_ grid: [[Int]]) -> Int {
    var grid = grid
    var id = 2, map = [Int:Int]()
    let dir = [(0, -1), (-1, 0), (0, 1), (1, 0)]
    
    func dfs(_ row: Int, _ col: Int, _ id: Int, _ curLen: inout Int) {
        grid[row][col] = id
        for (r, c) in dir {
            let (nR, nC) = (row + r, col + c)
            if 0...grid.count-1 ~= nR && 0...grid[0].count-1 ~= nC && grid[nR][nC] == 1 {
                curLen += 1
                dfs(nR, nC, id, &curLen)
            }
        }
    }
    
    for row in 0..<grid.count {
        for col in 0..<grid[0].count where grid[row][col] == 1{
            var curLen = 1
            dfs(row, col, id, &curLen)
            map[id] = curLen
            id += 1
        }
    }
    var maxLength = Int.min
    for row in 0..<grid.count {
        for col in 0..<grid[0].count where grid[row][col] == 0 {
            var curLen = 1, pSet = Set<Int>()
            for (r, c) in dir {
                let (nR, nC) = (row + r, col + c)
                if 0...grid.count-1 ~= nR && 0...grid[0].count-1 ~= nC && grid[nR][nC] != 0 {
                    let curID = grid[nR][nC]
                    if !pSet.contains(curID) {
                        curLen += map[curID]!
                        pSet.insert(curID)
                    }
                }
            }
            maxLength = max(maxLength, curLen)
        }
    }
    return maxLength == Int.min ? map.values.first! : maxLength
}
