//
//  longestIncreasingSubsequence-300.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/20/25.

/*
 https://leetcode.com/problems/longest-increasing-subsequence/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an integer array nums, return the length of the longest strictly increasing subsequence.

  

 Example 1:

 Input: nums = [10,9,2,5,3,7,101,18]
 Output: 4
 Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
 Example 2:

 Input: nums = [0,1,0,3,2,3]
 Output: 4
 Example 3:

 Input: nums = [7,7,7,7,7,7,7]
 Output: 1
  

 Constraints:

 1 <= nums.length <= 2500
 -104 <= nums[i] <= 104

 */

func lengthOfLIS(_ nums: [Int]) -> Int {
    var maximum = 1
    var dp = [Int](repeating: 1, count: nums.count)
    for i in stride(from: nums.count-2, through: 0, by: -1) {
        for j in i+1...nums.count-1 {
            if nums[i] < nums[j] {
                dp[i] = max(dp[j] + 1, dp[i])
            }
        }
        maximum = max(maximum, dp[i])
    }
    return maximum
}
