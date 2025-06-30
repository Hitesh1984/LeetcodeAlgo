//
//  countNumberOfFairPairs-2563.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/27/25.
/*
 https://leetcode.com/problems/count-the-number-of-fair-pairs/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given a 0-indexed integer array nums of size n and two integers lower and upper, return the number of fair pairs.

 A pair (i, j) is fair if:

 0 <= i < j < n, and
 lower <= nums[i] + nums[j] <= upper
  

 Example 1:

 Input: nums = [0,1,7,4,4,5], lower = 3, upper = 6
 Output: 6
 Explanation: There are 6 fair pairs: (0,3), (0,4), (0,5), (1,3), (1,4), and (1,5).
 Example 2:

 Input: nums = [1,7,9,2,5], lower = 11, upper = 11
 Output: 1
 Explanation: There is a single fair pair: (2,3).
  

 Constraints:

 1 <= nums.length <= 105
 nums.length == n
 -109 <= nums[i] <= 109
 -109 <= lower <= upper <= 109

 */

func countFairPairs(_ nums: [Int], _ lower: Int, _ upper: Int) -> Int {
    let sortedNums = nums.sorted()
    // [0,1,4,4,5,7]
    func countPairs(_ target: Int) -> Int {
        var left = 0
        var right = sortedNums.count - 1
        var count = 0
        while left < right {
            let currentSum = sortedNums[left] + sortedNums[right]
            if currentSum <= target {
                count += right - left // 4 + 3
                left += 1
            } else {
                right -= 1
            }
        }
        return count
    }
    return countPairs(upper) - countPairs(lower - 1)
}
