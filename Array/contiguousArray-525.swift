//
//  contiguousArray-525.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/17/25.
/*
 https://leetcode.com/problems/contiguous-array/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1.

  

 Example 1:

 Input: nums = [0,1]
 Output: 2
 Explanation: [0, 1] is the longest contiguous subarray with an equal number of 0 and 1.
 Example 2:

 Input: nums = [0,1,0]
 Output: 2
 Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
 Example 3:

 Input: nums = [0,1,1,1,1,1,0,0,0]
 Output: 6
 Explanation: [1,1,1,0,0,0] is the longest contiguous subarray with equal number of 0 and 1.
  

 Constraints:

 1 <= nums.length <= 105
 nums[i] is either 0 or 1.
 */

func findMaxLength(_ nums: [Int]) -> Int {
    var prefixSum = 0, map = [0: -1], result = 0
    for i in 0..<nums.count {
        if nums[i] == 0 {
            prefixSum -= 1 // -1
        } else {
            prefixSum += 1
        }
        if let j = map[prefixSum] {
            result = max(i - j, result)
        } else {
            map[prefixSum] = i
        }
    }
    return result
}
