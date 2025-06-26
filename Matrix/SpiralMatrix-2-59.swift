//
//  SpiralMatrix-2-59.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/11/25.

/*
 https://leetcode.com/problems/spiral-matrix-ii/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given a positive integer n, generate an n x n matrix filled with elements from 1 to n2 in spiral order.

  

 Example 1:


 Input: n = 3
 Output: [[1,2,3],[8,9,4],[7,6,5]]
 Example 2:

 Input: n = 1
 Output: [[1]]
  

 Constraints:

 1 <= n <= 20
 */


func generateMatrix(_ n: Int) -> [[Int]] {
    var arr = Array(repeating: (Array(repeating: 0, count: n)), count: n)
    var top = 0
    var left = 0
    var bottom = n-1
    var right = n-1
    var counter = 0
    while counter < n*n {
        for col in left...right {
            counter += 1
            arr[top][col] = counter
        }
        top += 1
        if counter >= n*n { return arr }
        for row in top...bottom {
            counter += 1
            arr[row][right] = counter
        }
        right -= 1
        if counter >= n*n { return arr }
        for col in stride(from:right , through:left , by: -1) {
            counter += 1
            arr[bottom][col] = counter
        }
        bottom -= 1
        if counter >= n*n { return arr }
        for row in stride(from:bottom , through:top , by: -1) {
            counter += 1
            arr[row][left] = counter
        }
        left += 1
    }
    return arr
}
