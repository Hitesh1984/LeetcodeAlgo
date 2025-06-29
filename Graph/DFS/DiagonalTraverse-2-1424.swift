//
//  DiagonalTraverse-2-1424.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/24/25.
/*
 https://leetcode.com/problems/diagonal-traverse-ii/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given a 2D integer array nums, return all elements of nums in diagonal order as shown in the below images.

  

 Example 1:


 Input: nums = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [1,4,2,7,5,3,8,6,9]
 Example 2:


 Input: nums = [[1,2,3,4,5],[6,7],[8],[9,10,11],[12,13,14,15,16]]
 Output: [1,6,2,8,7,3,9,4,12,10,5,13,11,14,15,16]
  

 Constraints:

 1 <= nums.length <= 105
 1 <= nums[i].length <= 105
 1 <= sum(nums[i].length) <= 105
 1 <= nums[i][j] <= 105

 */

func findDiagonalOrder2(_ nums: [[Int]]) -> [Int] {
    let rows = nums.count // Number of rows in the input matrix
    var res = [Int]() // Result array to store the diagonal order
    var queue = [(0, 0)] // Queue to keep track of the current position (row, column)
    
    // Process the queue until it is empty
    while !queue.isEmpty {
        // Dequeue the first element from the queue
        let (r, c) = queue.removeFirst()
        res.append(nums[r][c]) // Add the current element to the result array
        
        // If the current element is in the first column and not in the last row,
        // enqueue the element directly below it (moving downwards)
        if c == 0 && r + 1 < rows {
            queue.append((r + 1, c))
        }
        // Number of columns in the current row
        let cols = nums[r].count
        
        // If there is a next element in the current row (moving rightwards),
        // enqueue the element to the right
        if c + 1 < cols {
            queue.append((r, c + 1))
        }
    }
    return res // Return the result array
}
