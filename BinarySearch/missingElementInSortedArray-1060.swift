//
//  File.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/16/25.
/*
 https://leetcode.com/problems/missing-element-in-sorted-array/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given an integer array nums which is sorted in ascending order and all of its elements are unique and given also an integer k, return the kth missing number starting from the leftmost number of the array.

  

 Example 1:

 Input: nums = [4,7,9,10], k = 1
 Output: 5
 Explanation: The first missing number is 5.
 Example 2:

 Input: nums = [4,7,9,10], k = 3
 Output: 8
 Explanation: The missing numbers are [5,6,8,...], hence the third missing number is 8.
 Example 3:

 Input: nums = [1,2,4], k = 3
 Output: 6
 Explanation: The missing numbers are [3,5,6,7,...], hence the third missing number is 6.
  

 Constraints:

 1 <= nums.length <= 5 * 104
 1 <= nums[i] <= 107
 nums is sorted in ascending order, and all the elements are unique.
 1 <= k <= 108
  

 Follow up: Can you find a logarithmic time complexity (i.e., O(log(n))) solution?
 
 */

func missingElement(_ nums: [Int], _ k: Int) -> Int {
    var low = 0 // 0
    var high = nums.count - 1 // 3
    let offset = nums[0]
    while low < high {
        let mid = high - (high - low) / 2 // 2, 1
        let num = nums[mid] // 9, 7
        let difference = num - mid - offset // 3, 2
        if difference < k {
            low = mid // 1
        } else {
            high = mid - 1 // 2
        }
    }
    return  k + offset + low
}
