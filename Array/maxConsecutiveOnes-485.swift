//
//  maxConsecutiveOnes-485.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 11/13/25.

/*
 https://leetcode.com/problems/max-consecutive-ones/description/?envType=problem-list-v2&envId=array
 
 Given a binary array nums, return the maximum number of consecutive 1's in the array.

  

 Example 1:

 Input: nums = [1,1,0,1,1,1]
 Output: 3
 Explanation: The first two digits or the last three digits are consecutive 1s. The maximum number of consecutive 1s is 3.
 Example 2:

 Input: nums = [1,0,1,1,0,1]
 Output: 2
  

 Constraints:

 1 <= nums.length <= 105
 nums[i] is either 0 or 1.
  
 */

import Foundation

func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var res = 0
    var cur = 0
    for (_,num) in nums.enumerated()  {
        if num == 1 {
            cur += 1
            res = max(res, cur)
        } else {
            cur = 0
        }
    }
    return res
}
