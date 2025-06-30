//
//  squaresOfASortedArray-977.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/15/25.

/*
 https://leetcode.com/problems/squares-of-a-sorted-array/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

  

 Example 1:

 Input: nums = [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 Explanation: After squaring, the array becomes [16,1,0,9,100].
 After sorting, it becomes [0,1,9,16,100].
 Example 2:

 Input: nums = [-7,-3,2,3,11]
 Output: [4,9,9,49,121]
  

 Constraints:

 1 <= nums.length <= 104
 -104 <= nums[i] <= 104
 nums is sorted in non-decreasing order.
  
 */

func sortedSquares(_ nums: [Int]) -> [Int] {
    
    var result: [Int] = Array(repeating: 0, count: nums.count)
    
    var left = 0
    var right = nums.count - 1
    var index = nums.count - 1
    
    while left <= right {
        if nums[left] * nums[left] <= nums[right] * nums[right] {
            result[index] = nums[right] * nums[right]
            right -= 1
        } else {
            result[index] = nums[left] * nums[left]
            left += 1
        }
        index -= 1
    }
    return result
}
