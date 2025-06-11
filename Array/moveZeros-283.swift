//
//  moveZeros-283.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/6/25.

/*
 https://leetcode.com/problems/move-zeroes/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Note that you must do this in-place without making a copy of the array.

  

 Example 1:

 Input: nums = [0,1,0,3,12]
 Output: [1,3,12,0,0]
 Example 2:

 Input: nums = [0]
 Output: [0]
  

 Constraints:

 1 <= nums.length <= 104
 -231 <= nums[i] <= 231 - 1
  
 */

func moveZeroes(_ nums: inout [Int]) {
    var lastNonZeroIndex = 0
    for i in 0..<nums.count {
        if nums[i] == 0 { continue }
        nums.swapAt(i, lastNonZeroIndex)
        lastNonZeroIndex += 1
    }
}
