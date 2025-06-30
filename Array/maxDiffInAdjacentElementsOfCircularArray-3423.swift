//
//  maxDiffInAdjacentElementsOfCircularArray-3423.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/26/25.
/*
 https://leetcode.com/problems/maximum-difference-between-adjacent-elements-in-a-circular-array/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given a circular array nums, find the maximum absolute difference between adjacent elements.

 Note: In a circular array, the first and last elements are adjacent.

  

 Example 1:

 Input: nums = [1,2,4]

 Output: 3

 Explanation:

 Because nums is circular, nums[0] and nums[2] are adjacent. They have the maximum absolute difference of |4 - 1| = 3.

 Example 2:

 Input: nums = [-5,-10,-5]

 Output: 5

 Explanation:

 The adjacent elements nums[0] and nums[1] have the maximum absolute difference of |-5 - (-10)| = 5.

  

 Constraints:

 2 <= nums.length <= 100
 -100 <= nums[i] <= 100
 */

func maxAdjacentDistance(_ nums: [Int]) -> Int {
    var maxDiff = 0
    for (ind,num) in nums.enumerated() {
        var diff = 0
        if nums.count-1 == ind {
            diff = nums[0] - num
        } else {
            diff  = nums[ind+1] - num
        }
        maxDiff = max(maxDiff, abs(diff))
    }
    return maxDiff
}
