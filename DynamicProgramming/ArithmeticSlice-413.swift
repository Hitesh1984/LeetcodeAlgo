//
//  ArithmeticSlice-413.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 10/29/25.
//

/*
 https://leetcode.com/problems/arithmetic-slices/?envType=problem-list-v2&envId=array
 
 An integer array is called arithmetic if it consists of at least three elements and if the difference between any two consecutive elements is the same.

 For example, [1,3,5,7,9], [7,7,7,7], and [3,-1,-5,-9] are arithmetic sequences.
 Given an integer array nums, return the number of arithmetic subarrays of nums.

 A subarray is a contiguous subsequence of the array.

  

 Example 1:

 Input: nums = [1,2,3,4]
 Output: 3
 Explanation: We have 3 arithmetic slices in nums: [1, 2, 3], [2, 3, 4] and [1,2,3,4] itself.
 Example 2:

 Input: nums = [1]
 Output: 0
  

 Constraints:

 1 <= nums.length <= 5000
 -1000 <= nums[i] <= 1000
 */

import Foundation


func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
    var allSlices = 0
    var currentCount = 0
    
    for (index, _) in nums.enumerated() where index > 1 {
        
        if nums[index] - nums[index-1] == nums[index-1] - nums[index-2] {
            currentCount += 1
            allSlices += currentCount
        } else {
            currentCount = 0
        }
    }
    return allSlices
}
