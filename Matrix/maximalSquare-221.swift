//
//  maximalSquare-221.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/3/25.
//
/*
 https://leetcode.com/problems/maximal-square/description/
 
 Given an m x n binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

  

 Example 1:


 Input: matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
 Output: 4
 Example 2:


 Input: matrix = [["0","1"],["1","0"]]
 Output: 1
 Example 3:

 Input: matrix = [["0"]]
 Output: 0
  

 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 300
 matrix[i][j] is '0' or '1'.
 */
import Foundation

func maximalSquare(_ matrix: [[Character]]) -> Int {
    let rows = matrix.count
    let cols = matrix[0].count
    var beforeRow = Array(repeating:0, count:cols)
    var length = 0
    for row in 0..<rows {
        var currentRow = Array(repeating:0, count:cols)
        for col in 0..<cols where matrix[row][col] == "1"{
                if(col <= 0){
                    currentRow[col] = 1
                }else {
                    currentRow[col] = 1 + min(beforeRow[col],
                    min(currentRow[col-1], beforeRow[col-1]))
                }
                length = max(currentRow[col], length)
        }
        beforeRow = currentRow
    }
    return length*length
}
