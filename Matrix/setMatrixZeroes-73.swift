//
//  setMatrixZeroes-73.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/25/25.

/*
 https://leetcode.com/problems/set-matrix-zeroes/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's.
 
 You must do it in place.
 
 
 
 Example 1:
 
 
 Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
 Output: [[1,0,1],[0,0,0],[1,0,1]]
 Example 2:
 
 
 Input: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
 Output: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]
 
 
 Constraints:
 
 m == matrix.length
 n == matrix[0].length
 1 <= m, n <= 200
 -231 <= matrix[i][j] <= 231 - 1
 
 */

func setZeroes(_ matrix: inout [[Int]]) {
    let rows = matrix.count
    let cols = matrix[0].count
    
    func setMax( _ row: Int, _ col: Int) {
        for i in 0..<rows {
            if matrix[i][col] != 0 {
                matrix[i][col] = Int.max
            }
        }
        for j in 0..<cols {
            if matrix[row][j] != 0 {
                matrix[row][j] = Int.max
            }
        }
    }
    
    for i in 0..<rows {
        for j in 0..<cols {
            if matrix[i][j] == 0 {
                setMax(i, j)
            }
        }
    }
    for i in 0..<rows {
        for j in 0..<cols {
            if matrix[i][j] == Int.max {
                matrix[i][j] = 0
            }
        }
    }
}
