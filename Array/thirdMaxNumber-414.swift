//
//  thirdMaxNumber-414.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 10/29/25.
/*
 https://leetcode.com/problems/third-maximum-number/description/?envType=problem-list-v2&envId=array
 
 Given an integer array nums, return the third distinct maximum number in this array. If the third maximum does not exist, return the maximum number.

  

 Example 1:

 Input: nums = [3,2,1]
 Output: 1
 Explanation:
 The first distinct maximum is 3.
 The second distinct maximum is 2.
 The third distinct maximum is 1.
 Example 2:

 Input: nums = [1,2]
 Output: 2
 Explanation:
 The first distinct maximum is 2.
 The second distinct maximum is 1.
 The third distinct maximum does not exist, so the maximum (2) is returned instead.
 Example 3:

 Input: nums = [2,2,3,1]
 Output: 1
 Explanation:
 The first distinct maximum is 3.
 The second distinct maximum is 2 (both 2's are counted together since they have the same value).
 The third distinct maximum is 1.
  

 Constraints:

 1 <= nums.length <= 104
 -231 <= nums[i] <= 231 - 1
 */

func thirdMax(_ nums: [Int]) -> Int {
    var maxCount = 1
    var numsCopy = Set(nums)
    let k = 3 // this will be dynamic, so we can find any kth Max number, here it is 3.
    if numsCopy.count < k {
        return nums.max()!
    }
    
    while maxCount <= k {
        let maximum = numsCopy.firstIndex(of: numsCopy.max()!)!
        numsCopy.remove(at: maximum)
        maxCount += 1
        if maxCount == 3 {
            return numsCopy.max()!
        }
    }
    
    return 0
}
