//
//  splitArrayLargestSum-410.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/9/25.

/*
 https://leetcode.com/problems/split-array-largest-sum/
 
 Given an integer array nums and an integer k, split nums into k non-empty subarrays such that the largest sum of any subarray is minimized.

 Return the minimized largest sum of the split.

 A subarray is a contiguous part of the array.

  

 Example 1:

 Input: nums = [7,2,5,10,8], k = 2
 Output: 18
 Explanation: There are four ways to split nums into two subarrays.
 The best way is to split it into [7,2,5] and [10,8], where the largest sum among the two subarrays is only 18.
 Example 2:

 Input: nums = [1,2,3,4,5], k = 2
 Output: 9
 Explanation: There are four ways to split nums into two subarrays.
 The best way is to split it into [1,2,3] and [4,5], where the largest sum among the two subarrays is only 9.
  

 Constraints:

 1 <= nums.length <= 1000
 0 <= nums[i] <= 106
 1 <= k <= min(50, nums.length)
 */

func splitArray(_ nums: [Int], _ k: Int) -> Int {
    var left = nums.max() ?? nums[0]
    var right:Int = nums.reduce(0, +) ?? 0
    var result = Int.max
    func isValidSplitSum(_ aSplitSum: Int, _ k: Int) -> Bool {
        var i = 0, splits = 0
        while i < nums.count {
            var sum = 0
            while i < nums.count && sum + nums[i] <= aSplitSum {
                sum += nums[i]
                i += 1
            }
            splits += 1
        }
        return splits <= k
    }
    while left <= right {
        let mid = left + (right - left)/2
        if isValidSplitSum(mid, k) {
            result = min(result, mid)
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return result
}
