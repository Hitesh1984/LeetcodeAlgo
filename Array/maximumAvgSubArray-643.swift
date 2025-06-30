//
//  maximumAvgSubArray-643.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/26/25.
/*
 https://leetcode.com/problems/maximum-average-subarray-i/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 You are given an integer array nums consisting of n elements, and an integer k.

 Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.

  

 Example 1:

 Input: nums = [1,12,-5,-6,50,3], k = 4
 Output: 12.75000
 Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75
 Example 2:

 Input: nums = [5], k = 1
 Output: 5.00000
  

 Constraints:

 n == nums.length
 1 <= k <= n <= 105
 -104 <= nums[i] <= 104
 */

func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
    var maxSumm = Int.min
    var summ = 0
    
    for i in 0...k - 1 {
        summ += nums[i]
    }
    
    maxSumm = max(maxSumm, summ)
    if k == nums.count {
        return Double(maxSumm) / Double(k)
    }
    
    for i in k...nums.count - 1 {
        summ = summ + nums[i] - nums[i - k]
        maxSumm = max(maxSumm, summ)
    }
    
    return Double(maxSumm) / Double(k)
}
