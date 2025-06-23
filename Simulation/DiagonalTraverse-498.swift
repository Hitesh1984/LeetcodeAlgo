//
//  DiagonalTraverse-498.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/22/25.
/*
 https://leetcode.com/problems/diagonal-traverse/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given an m x n matrix mat, return an array of all the elements of the array in a diagonal order.

  

 Example 1:


 Input: mat = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [1,2,4,7,5,3,6,8,9]
 Example 2:

 Input: mat = [[1,2],[3,4]]
 Output: [1,2,3,4]
  

 Constraints:

 m == mat.length
 n == mat[i].length
 1 <= m, n <= 104
 1 <= m * n <= 104
 -105 <= mat[i][j] <= 105
 */

func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
    var maxSize = 0
    var result: [Int] = []
    var map: [Int: [Int]] = [:]
    for row in 0..<mat.count {
        for col in 0..<mat[0].count {
            maxSize = max(maxSize, row + col)
            map[row + col, default: []].append(mat[row][col])
        }
    }
    for index in 0...maxSize {
        result.append(contentsOf: index % 2 == 0 ? map[index]!.reversed() : map[index]!)
    }
    map.removeAll()
    return result
}
