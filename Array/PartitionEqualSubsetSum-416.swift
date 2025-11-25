//
//  PartitionEqualSubsetSum-416.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 10/30/25.
/*
 https://leetcode.com/problems/partition-equal-subset-sum/description/?envType=problem-list-v2&envId=array
 
 Given an integer array nums, return true if you can partition the array into two subsets such that the sum of the elements in both subsets is equal or false otherwise.

  

 Example 1:

 Input: nums = [1,5,11,5]
 Output: true
 Explanation: The array can be partitioned as [1, 5, 5] and [11].
 Example 2:

 Input: nums = [1,2,3,5]
 Output: false
 Explanation: The array cannot be partitioned into equal sum subsets.
  

 Constraints:

 1 <= nums.length <= 200
 1 <= nums[i] <= 100
 */

func canPartition(_ nums: [Int]) -> Bool {
    let sum = nums.reduce(0, +)
    if sum % 2 != 0 { return false }
    let target = sum / 2
    var dp = Array(repeating: false, count: target + 1)
    dp[0] = true
    for num in nums where num <= target {
        if num == target || dp[target] { return true }
        for i in (num...target).reversed() where !dp[i] {
            dp[i] = dp[i - num]
        }
    }
    return dp[target]
}
