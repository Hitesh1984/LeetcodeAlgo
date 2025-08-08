//
//  pascalTriangel-118.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/8/25.
//
/*
 https://leetcode.com/problems/pascals-triangle/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an integer numRows, return the first numRows of Pascal's triangle.
 
 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:
 
 
 
 
 Example 1:
 
 Input: numRows = 5
 Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
 Example 2:
 
 Input: numRows = 1
 Output: [[1]]
 
 
 Constraints:
 
 1 <= numRows <= 30
 */
import Foundation


func generate(_ numRows: Int) -> [[Int]] {
    var ans = [[Int]](repeating: [Int](), count: numRows)
    for i in 0..<numRows {
        ans[i] = [Int](repeating: 0, count: i+1)
        for j in 0..<i+1 {
            if j == 0 || j == i {
                ans[i][j] = 1
            } else {
                ans[i][j] = ans[i-1][j-1] + ans[i-1][j]
            }
        }
    }
    return ans
    ans.last
}
