//
//  longestMountainInArray-845.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 11/5/25.
/*
 https://leetcode.com/problems/longest-mountain-in-array/description/?envType=problem-list-v2&envId=dynamic-programming
 
 You may recall that an array arr is a mountain array if and only if:

 arr.length >= 3
 There exists some index i (0-indexed) with 0 < i < arr.length - 1 such that:
 arr[0] < arr[1] < ... < arr[i - 1] < arr[i]
 arr[i] > arr[i + 1] > ... > arr[arr.length - 1]
 Given an integer array arr, return the length of the longest subarray, which is a mountain. Return 0 if there is no mountain subarray.

  

 Example 1:

 Input: arr = [2,1,4,7,3,2,5]
 Output: 5
 Explanation: The largest mountain is [1,4,7,3,2] which has length 5.
 Example 2:

 Input: arr = [2,2,2]
 Output: 0
 Explanation: There is no mountain.
  

 Constraints:

 1 <= arr.length <= 104
 0 <= arr[i] <= 104
  
 */

func longestMountain(_ nums: [Int]) -> Int {
    guard nums.count > 2 else {
        return 0
    }
    var largestLength = 0
    var currentLength = 1
    var ascending = true
    var prev = nums[0]
    for (ind, cur) in nums.enumerated() where ind > 0 {
        // detect peak
        if currentLength > 1 && ascending && prev > cur {
            ascending = false
        }
        if (ascending && prev < cur) {
            // continue mountain up
            currentLength += 1
        } else if (!ascending && prev > cur) {
            // continue mountain down
            currentLength += 1
            largestLength = max(currentLength, largestLength)
        } else {
            // end of a mountain, reset state
            currentLength = prev < cur ? 2 : 1 // if prev < cur, use that as a new mountain start already
            ascending = true
        }
        prev = cur
    }
    return largestLength
}
