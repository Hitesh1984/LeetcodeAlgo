//
//  singleNumber-2-137.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/23/25.
/*
 https://leetcode.com/problems/single-number-ii/?envType=company&envId=yahoo&favoriteSlug=yahoo-more-than-six-months
 
 Given an integer array nums where every element appears three times except for one, which appears exactly once. Find the single element and return it.

 You must implement a solution with a linear runtime complexity and use only constant extra space.

  

 Example 1:

 Input: nums = [2,2,3,2]
 Output: 3
 Example 2:

 Input: nums = [0,1,0,1,0,1,99]
 Output: 99
  

 Constraints:

 1 <= nums.length <= 3 * 104
 -231 <= nums[i] <= 231 - 1
 Each element in nums appears exactly three times except for one element which appears once.

 */

func singleNumber2(_ nums: [Int]) -> Int {
    var a = 0
    var b = 0
    for num in nums {
        let newA = a & ~b & ~num + ~a & b & num
        let newB = ~a & b & ~num + ~a & ~b & num
        (a, b) = (newA, newB)
    }
    return a | b
}
