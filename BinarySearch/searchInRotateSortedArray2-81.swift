//
//  searchInRotateSortedArray2-81.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/29/25.
//

/*
 https://leetcode.com/problems/search-in-rotated-sorted-array-ii/
 
 There is an integer array nums sorted in non-decreasing order (not necessarily with distinct values).

 Before being passed to your function, nums is rotated at an unknown pivot index k (0 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,4,4,5,6,6,7] might be rotated at pivot index 5 and become [4,5,6,6,7,0,1,2,4,4].

 Given the array nums after the rotation and an integer target, return true if target is in nums, or false if it is not in nums.

 You must decrease the overall operation steps as much as possible.

  

 Example 1:

 Input: nums = [2,5,6,0,0,1,2], target = 0
 Output: true
 Example 2:

 Input: nums = [2,5,6,0,0,1,2], target = 3
 Output: false
  

 Constraints:

 1 <= nums.length <= 5000
 -104 <= nums[i] <= 104
 nums is guaranteed to be rotated at some pivot.
 -104 <= target <= 104
 
 */

import Foundation

/*
 Input: nums = [2,5,6,0,0,1,2], target = 0
 Output: true

 Input: nums = [2,5,6,0,0,1,2], target = 3
 Output: false
 */

func search(_ nums: [Int], _ target: Int) -> Bool {
    var left = 0;
    var right = nums.count - 1;
    // Continue searching while the window is valid
    //nums = [2,5,6,0,0,1,2], target = 0
    while (left < right) {
        let mid = left + (right - left) / 2
        // If middle element is greater than the rightmost element, the pivot is in the right half
        if (nums[mid] > nums[right]) {
            // If target lies within the left sorted portion
            if nums[left] ... nums[mid] ~= target {
                right = mid
            } else {
                left = mid + 1
            }
        }
        // If middle element is less than the rightmost element, the left half is sorted properly
        else if (nums[mid] < nums[right]) {
            // If target lies within the right sorted portion
            
            if (nums[mid] < target && target <= nums[right]) {
                left = mid + 1; // Narrow down to right half
            } else {
                right = mid; // Search in the left half
            }
        }
        // If middle element equals the rightmost element, we can't determine the pivot
        // so we reduce the search space by moving the right pointer one step to the left
        else {  right -= 1 }
    }
    // After the loop ends, left == right,
    // checking if we have found the target
    return nums[left] == target;
}
