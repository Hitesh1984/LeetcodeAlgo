//
//  missingRanges-163.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/17/25.
/*
 https://leetcode.com/problems/missing-ranges/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 You are given an inclusive range [lower, upper] and a sorted unique integer array nums, where all elements are within the inclusive range.

 A number x is considered missing if x is in the range [lower, upper] and x is not in nums.

 Return the shortest sorted list of ranges that exactly covers all the missing numbers. That is, no element of nums is included in any of the ranges, and each missing number is covered by one of the ranges.

  

  

 Example 1:

 Input: nums = [0,1,3,50,75], lower = 0, upper = 99
 Output: [[2,2],[4,49],[51,74],[76,99]]
 Explanation: The ranges are:
 [2,2]
 [4,49]
 [51,74]
 [76,99]
 Example 2:

 Input: nums = [-1], lower = -1, upper = -1
 Output: []
 Explanation: There are no missing ranges since there are no missing numbers.
  

 Constraints:

 -109 <= lower <= upper <= 109
 0 <= nums.length <= 100
 lower <= nums[i] <= upper
 All the values of nums are unique.
 */

func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [[Int]] {
    guard !nums.isEmpty else {
        return [[lower, upper]]
    }
    var missingRanges: [[Int]] = []
    if nums.first! > lower {
        missingRanges.append([lower, nums.first! - 1])
    }
    for i in 1..<nums.count {
        let current = nums[i]
        let prev = nums[i - 1]
        if current - prev != 1 {
            missingRanges.append([prev + 1, current - 1])
        }
    }
    if nums.last! + 1 <= upper {
        missingRanges.append([nums.last! + 1, upper])
    }
    return missingRanges
}
