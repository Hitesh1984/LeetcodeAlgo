//
//  01Matrix-542.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/6/25.
/*
 https://leetcode.com/problems/01-matrix/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an m x n binary matrix mat, return the distance of the nearest 0 for each cell.

 The distance between two cells sharing a common edge is 1.

  

 Example 1:


 Input: mat = [[0,0,0],[0,1,0],[0,0,0]]
 Output: [[0,0,0],[0,1,0],[0,0,0]]
 Example 2:


 Input: mat = [[0,0,0],[0,1,0],[1,1,1]]
 Output: [[0,0,0],[0,1,0],[1,2,1]]
  

 Constraints:

 m == mat.length
 n == mat[i].length
 1 <= m, n <= 104
 1 <= m * n <= 104
 mat[i][j] is either 0 or 1.
 There is at least one 0 in mat.
  

 Note: This question is the same as 1765: https://leetcode.com/problems/map-of-highest-peak/


 */

func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
    let ROW = mat.count
    let COL = mat[0].count
    var ans = Array(repeating: Array(repeating: Int.max, count: COL), count: ROW)
    var queue = [(Int, Int)]()
    for row in 0..<ROW {
        for col in 0..<COL {
            if mat[row][col] == 0 {
                queue.append((row, col))
                ans[row][col] = 0
            }
        }
    }
    while !queue.isEmpty {
        for i in 0..<queue.count {
            let (row, col) = queue.removeFirst()
            for (r, c) in [(-1, 0), (0, 1), (1, 0), (0, -1)] {
                let (nR, nC) = (r + row, c + col)
                if nR >= 0 && nR < ROW && nC >= 0 && nC < COL &&  ans[nR][nC] == Int.max {
                    ans[nR][nC] = ans[row][col] + 1
                    queue.append((nR, nC))
                }
            }
        }
    }
    return ans
}
