//
//  longestConsecutiveSequences-128.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/19/25.

/*
 https://leetcode.com/problems/longest-consecutive-sequence/description/
 
 Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
 
 You must write an algorithm that runs in O(n) time.
 
 
 
 Example 1:
 
 Input: nums = [100,4,200,1,3,2]
 Output: 4
 Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
 Example 2:
 
 Input: nums = [0,3,7,2,5,8,4,6,0,1]
 Output: 9
 Example 3:
 
 Input: nums = [1,0,1,2]
 Output: 3
 
 
 Constraints:
 
 0 <= nums.length <= 105
 -109 <= nums[i] <= 109
 
 */

import Foundation

func longestConsecutive(_ nums: [Int]) -> Int {
    var set = Set(nums)
    var maxi = 0
    
    for item in set {
        var count = 1
        if !set.contains(item-1) {
            while(set.contains(item+count)) {
                count+=1
            }
        }
        maxi = max(maxi, count)
    }
    return maxi
}
