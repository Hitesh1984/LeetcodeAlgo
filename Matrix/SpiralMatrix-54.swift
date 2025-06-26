//
//  SpiralMatrix-54.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/3/25.
//

/*
 https://leetcode.com/problems/spiral-matrix/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 
 Given an m x n matrix, return all elements of the matrix in spiral order.
 
 
 
 Example 1:
 
 
 Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [1,2,3,6,9,8,7,4,5]
 Example 2:
 
 
 Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 
 
 Constraints:
 
 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 10
 -100 <= matrix[i][j] <= 100
 
 */

import Foundation

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var left = 0
    var top = 0
    var right = matrix[0].count-1
    var bottom = matrix.count-1
    let total = matrix.count * matrix[0].count
    var sprialArray = [Int]()
    //[[1,2,3],[4,5,6],[7,8,9]]
    while sprialArray.count < total {
        for col in left...right {
            sprialArray.append(matrix[top][col])
        }
        top = top+1
        if sprialArray.count == total { break }
        
        for row in top...bottom {
            sprialArray.append(matrix[row][right])
        }
        right -= 1
        if sprialArray.count == total { break }
        
        
        
        for col in stride(from:right, through:left, by:-1) {
            sprialArray.append(matrix[bottom][col])
        }
        bottom -= 1
        if sprialArray.count == total { break }
        
        for row in stride(from:bottom, through:top, by:-1) {
            sprialArray.append(matrix[row][left])
        }
        left += 1
        if sprialArray.count == total { break }
    }
    return sprialArray
}
