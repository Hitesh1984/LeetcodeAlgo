//
//  Pascal'sTriangel-2-119.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/23/25.
/*
 https://leetcode.com/problems/pascals-triangle-ii/description/?envType=company&envId=yahoo&favoriteSlug=yahoo-more-than-six-months
 
 Given an integer rowIndex, return the rowIndexth (0-indexed) row of the Pascal's triangle.

 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:


  

 Example 1:

 Input: rowIndex = 3
 Output: [1,3,3,1]
 Example 2:

 Input: rowIndex = 0
 Output: [1]
 Example 3:

 Input: rowIndex = 1
 Output: [1,1]
  

 Constraints:

 0 <= rowIndex <= 33
 */

func getRow(_ numRows: Int) -> [Int] {
    var ans = [[Int]] (repeating: [Int](), count: numRows+1)
    for i in 0..<(numRows+1) {
        ans[i] = [Int](repeating: 0, count: i+1)
        for j in 0..<i+1 {
            if (j == 0 || j == i) {
                ans[i][j] = 1
            } else {
                ans[i][j] =  ans[i-1][j-1] + ans[i-1][j]
            }
        }
    }
    return ans.last!
}
