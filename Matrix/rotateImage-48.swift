//
//  rotateImage-48.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/7/25.
//
/*
 https://leetcode.com/problems/rotate-image/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).

 You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

  

 Example 1:


 Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [[7,4,1],[8,5,2],[9,6,3]]
 Example 2:


 Input: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
 Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
  

 Constraints:

 n == matrix.length == matrix[i].length
 1 <= n <= 20
 -1000 <= matrix[i][j] <= 1000
 */

import Foundation

func rotate(_ matrix: inout [[Int]]) {
//i/p    [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
    /// reverse   [   [15,14,12,16], [13,3,6,7],  ,[2,4,8,10],  [5,1,9,11]]
/// o/p  [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
    matrix.reverse()
    
    // Step 2: Flip diagonally
    for i in 0..<matrix.count {
        for j in 0..<i {
            let temp = matrix[i][j]
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = temp
        }
    }
}
