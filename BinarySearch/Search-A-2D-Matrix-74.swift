//
//  Search-A-2D-Matrix-74.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/6/25.
/*
 https://leetcode.com/problems/search-a-2d-matrix/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 You are given an m x n integer matrix matrix with the following two properties:

 Each row is sorted in non-decreasing order.
 The first integer of each row is greater than the last integer of the previous row.
 Given an integer target, return true if target is in matrix or false otherwise.

 You must write a solution in O(log(m * n)) time complexity.

  

 Example 1:


 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
 Output: true
 Example 2:


 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
 Output: false
  

 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 100
 -104 <= matrix[i][j], target <= 104

 */

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    let row = matrix.count
    let col = matrix[0].count
    var left = 0
    var right = (row*col) - 1
    while left <= right {
        let mid = left + (right - left) / 2
        
        let midVal = matrix[mid/col][mid%col]
        if midVal == target {
            return true
        } else if midVal < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return false
}
