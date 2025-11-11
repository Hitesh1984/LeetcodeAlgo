//
//  3SumSmaller-259.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/17/25.
/*
 https://leetcode.com/problems/3sum-smaller/description/?envType=company&envId=paypal&favoriteSlug=paypal-six-months
 
 Given an array of n integers nums and an integer target, find the number of index triplets i, j, k with 0 <= i < j < k < n that satisfy the condition nums[i] + nums[j] + nums[k] < target.

  

 Example 1:

 Input: nums = [-2,0,1,3], target = 2
 Output: 2
 Explanation: Because there are two triplets which sums are less than 2:
 [-2,0,1]
 [-2,0,3]
 Example 2:

 Input: nums = [], target = 0
 Output: 0
 Example 3:

 Input: nums = [0], target = 0
 Output: 0
  

 Constraints:

 n == nums.length
 0 <= n <= 3500
 -100 <= nums[i] <= 100
 -100 <= target <= 100
 */

func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
    let n = nums.count
    var cnt = 0
    let nums = nums.sorted()
    for i in 0..<n {
        let num = nums[i]
        var start = i+1
        var end = n-1
        while start < end {
            if (num + nums[start] + nums[end]) < target {
                cnt += (end-start)
                start += 1
            }else {
                end -= 1
            }
        }
    }
    return cnt
}
