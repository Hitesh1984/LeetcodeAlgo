//
//  pakIndexInAMountainArray-852.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/24/25.
/*
 https://leetcode.com/problems/peak-index-in-a-mountain-array/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 You are given an integer mountain array arr of length n where the values increase to a peak element and then decrease.

 Return the index of the peak element.

 Your task is to solve it in O(log(n)) time complexity.

  

 Example 1:

 Input: arr = [0,1,0]

 Output: 1

 Example 2:

 Input: arr = [0,2,1,0]

 Output: 1

 Example 3:

 Input: arr = [0,10,5,2]

 Output: 1

  

 Constraints:

 3 <= arr.length <= 105
 0 <= arr[i] <= 106
 arr is guaranteed to be a mountain array.

 */

func peakIndexInMountainArray(_ arr: [Int]) -> Int {
    var left = 0
    var right = arr.count-1
    var mid = left + (right - left) / 2
    while left < right {
        mid = left + (right - left) / 2
        if arr[mid] > arr[mid+1] {
            right = mid
        } else {
            left = mid+1
        }
    }
    return left
}
