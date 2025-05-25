//
//  majorityElement-229.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/29/25.
//

/*
 https://leetcode.com/problems/majority-element-ii/description/
 
 Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.

  

 Example 1:

 Input: nums = [3,2,3]
 Output: [3]
 Example 2:

 Input: nums = [1]
 Output: [1]
 Example 3:

 Input: nums = [1,2]
 Output: [1,2]
  

 Constraints:

 1 <= nums.length <= 5 * 104
 -109 <= nums[i] <= 109
  

 Follow up: Could you solve the problem in linear time and in O(1) space?
 
 */

import Foundation

func majorityElement(_ nums: [Int]) -> [Int] {
       //return Array(nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }.filter { $0.value > (nums.count / 3) }.keys)
    
    return Array(nums.reduce(into: [:]) {
        $0[$1, default:0] += 1}.filter{ $0.value > (nums.count / 3 )}.keys)
    
}
