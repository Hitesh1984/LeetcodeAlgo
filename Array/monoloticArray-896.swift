//
//  monoloticArray-896.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/24/25.
/*
 https://leetcode.com/problems/monotonic-array/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 An array is monotonic if it is either monotone increasing or monotone decreasing.

 An array nums is monotone increasing if for all i <= j, nums[i] <= nums[j]. An array nums is monotone decreasing if for all i <= j, nums[i] >= nums[j].

 Given an integer array nums, return true if the given array is monotonic, or false otherwise.

  

 Example 1:

 Input: nums = [1,2,2,3]
 Output: true
 Example 2:

 Input: nums = [6,5,4,4]
 Output: true
 Example 3:

 Input: nums = [1,3,2]
 Output: false
  

 Constraints:

 1 <= nums.length <= 105
 -105 <= nums[i] <= 105
 */

func isMonotonic(_ nums: [Int]) -> Bool {
    
    var incr = false
    var decr = false
    for ind in nums.indices.dropLast() {
        if nums[ind] > nums[ind+1] {
            incr = true
        } else if nums[ind] < nums[ind+1] {
            decr = true
        }
    }
    
    return  (incr && !decr) || (decr && !incr) || (!decr && !incr)
}
