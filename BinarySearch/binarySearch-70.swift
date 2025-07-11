//
//  binarySearch-70.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/30/25.
/*
 https://leetcode.com/problems/binary-search/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.

 You must write an algorithm with O(log n) runtime complexity.

  

 Example 1:

 Input: nums = [-1,0,3,5,9,12], target = 9
 Output: 4
 Explanation: 9 exists in nums and its index is 4
 Example 2:

 Input: nums = [-1,0,3,5,9,12], target = 2
 Output: -1
 Explanation: 2 does not exist in nums so return -1
  

 Constraints:

 1 <= nums.length <= 104
 -104 < nums[i], target < 104
 All the integers in nums are unique.
 nums is sorted in ascending order.

 */

func search111(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count
    while left < right {
        let mid = (left + right)/2
        if nums[mid] == target {
            return mid
        } else if target > nums[mid]  {
            left = mid + 1
        } else {
            right = mid
        }
    }
    return -1
}
