//
//  ContainsDuplicat2-219.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/28/25.
//

/*
 https://leetcode.com/problems/contains-duplicate-ii/description/?envType=problem-list-v2&envId=sliding-window
 
 Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.

  

 Example 1:

 Input: nums = [1,2,3,1], k = 3
 Output: true
 Example 2:

 Input: nums = [1,0,1,1], k = 1
 Output: true
 Example 3:

 Input: nums = [1,2,3,1,2,3], k = 2
 Output: false
  

 Constraints:

 1 <= nums.length <= 105
 -109 <= nums[i] <= 109
 0 <= k <= 105
 */
import Foundation


func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    if nums.count < 2 || k < 1 {
        return false
    }
    var itemIndex = [Int:Int]()
    
    for (index, num) in nums.enumerated() {
        if let prev = itemIndex[num], index-prev <= k {
            return true
        }
        itemIndex[num] = index
    }
    return false
}

/*
let ret1 = constructMaximumBinaryTree([1,2,3,1], 3)
print(ret1)

let ret2 = constructMaximumBinaryTree([1,0,1,1], 1)
print(ret2)

let ret3 = constructMaximumBinaryTree([1,2,3,1,2,3], 2)
print(ret3)
*/
