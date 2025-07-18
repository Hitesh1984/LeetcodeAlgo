//
//  WiggleSort-2-324.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/14/25.
/*
 https://leetcode.com/problems/wiggle-sort-ii/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an integer array nums, reorder it such that nums[0] < nums[1] > nums[2] < nums[3]....

 You may assume the input array always has a valid answer.

  

 Example 1:

 Input: nums = [1,5,1,1,6,4]
 Output: [1,6,1,5,1,4]
 Explanation: [1,4,1,5,1,6] is also accepted.
 Example 2:

 Input: nums = [1,3,2,2,3,1]
 Output: [2,3,1,3,1,2]
  

 Constraints:

 1 <= nums.length <= 5 * 104
 0 <= nums[i] <= 5000
 It is guaranteed that there will be an answer for the given input nums.
 */

func wiggleSort(_ nums: inout [Int]) {
    var array = nums.sorted()
    
    for i in stride(from: 1, to: nums.count, by: 2) {
        nums[i] = array.removeLast()
    }
    
    for i in stride(from: 0, to: nums.count, by: 2) {
        nums[i] = array.removeLast()
    }
}
