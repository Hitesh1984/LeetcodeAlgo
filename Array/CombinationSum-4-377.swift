//
//  CombinationSum-4-377.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 10/30/25.
/*
 
 https://leetcode.com/problems/combination-sum-iv/description/?envType=problem-list-v2&envId=array
 
 Given an array of distinct integers nums and a target integer target, return the number of possible combinations that add up to target.

 The test cases are generated so that the answer can fit in a 32-bit integer.

  

 Example 1:

 Input: nums = [1,2,3], target = 4
 Output: 7
 Explanation:
 The possible combination ways are:
 (1, 1, 1, 1)
 (1, 1, 2)
 (1, 2, 1)
 (1, 3)
 (2, 1, 1)
 (2, 2)
 (3, 1)
 Note that different sequences are counted as different combinations.
 Example 2:

 Input: nums = [9], target = 3
 Output: 0
  

 Constraints:

 1 <= nums.length <= 200
 1 <= nums[i] <= 1000
 All the elements of nums are unique.
 1 <= target <= 1000
  
 */


import Foundation

func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
    var dp = [Double](repeatElement(0, count: target + 1))
    
    dp[0] = 1
    for i in 1..<dp.count {
        for j in 0..<nums.count {
            if i - nums[j] >= 0 {
                dp[i] += dp[i - nums[j]]
            }
        }
    }
    
    return Int(dp[target])
}
