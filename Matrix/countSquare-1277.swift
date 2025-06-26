//
//  countSquare-1277.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/3/25.
//
/*
 https://leetcode.com/problems/count-square-submatrices-with-all-ones/description/
 
 Given a m * n matrix of ones and zeros, return how many square submatrices have all ones.
 
 
 
 Example 1:
 
 Input: matrix =
 [
 [0,1,1,1],
 [1,1,1,1],
 [0,1,1,1]
 ]
 Output: 15
 Explanation:
 There are 10 squares of side 1.
 There are 4 squares of side 2.
 There is  1 square of side 3.
 Total number of squares = 10 + 4 + 1 = 15.
 Example 2:
 
 Input: matrix =
 [
 [1,0,1],
 [1,1,0],
 [1,1,0]
 ]
 Output: 7
 Explanation:
 There are 6 squares of side 1.
 There is 1 square of side 2.
 Total number of squares = 6 + 1 = 7.
 
 
 Constraints:
 
 1 <= arr.length <= 300
 1 <= arr[0].length <= 300
 0 <= arr[i][j] <= 1
 */
import Foundation

//  [[1,0,1],[1,1,0],[1,1,0]]
func countSquares(_ matrix: [[Int]]) -> Int {
    let rows = matrix.count
    let cols = matrix[0].count
    var beforeRow = Array(repeating:0, count:cols)
    var res = 0
    for row in 0..<rows {
        var currentRow = Array(repeating:0, count:cols)
        for col in 0..<cols where matrix[row][col] == 1 {
            if(col <= 0){
                currentRow[col] = 1
            }else {
                currentRow[col] = 1 + min(beforeRow[col],
                                          min(currentRow[col-1],
                                              beforeRow[col-1]))
            }
            res += currentRow[col]
        }
        beforeRow = currentRow
    }
    return res
}
