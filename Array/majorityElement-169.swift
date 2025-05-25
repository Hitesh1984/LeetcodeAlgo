//
//  majorityElement-169.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/20/25.
/*
 https://leetcode.com/problems/majority-element/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an array nums of size n, return the majority element.

 The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

  

 Example 1:

 Input: nums = [3,2,3]
 Output: 3
 Example 2:

 Input: nums = [2,2,1,1,1,2,2]
 Output: 2
  

 Constraints:

 n == nums.length
 1 <= n <= 5 * 104
 -109 <= nums[i] <= 109
  
 */

import Foundation

func majorityElement(_ nums: [Int]) -> Int {
    return nums.sorted(by:<)[nums.count/2]
}
