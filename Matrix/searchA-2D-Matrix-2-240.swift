//
//  searchA-2D-Matrix-2-240.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/13/25.

/*
 https://leetcode.com/problems/search-a-2d-matrix-ii/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Write an efficient algorithm that searches for a value target in an m x n integer matrix matrix. This matrix has the following properties:

 Integers in each row are sorted in ascending from left to right.
 Integers in each column are sorted in ascending from top to bottom.
  

 Example 1:


 Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
 Output: true
 Example 2:


 Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20
 Output: false
  

 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= n, m <= 300
 -109 <= matrix[i][j] <= 109
 All the integers in each row are sorted in ascending order.
 All the integers in each column are sorted in ascending order.
 -109 <= target <= 109
 */

func searchMatrix2(_ matrix: [[Int]], _ target: Int) -> Bool {
    let rows = matrix.count
    let cols = matrix[0].count
    var row = 0
    var col = cols - 1
    while row < rows  && col >= 0 {
        
        let val = matrix[row][col]
        guard val != target else { return true }
        val < target ? (row += 1) : (col -= 1)
    }
    return false
}
