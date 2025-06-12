//
//  maxConsecutiveOnes-3-1004.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/5/25.
/*
 https://leetcode.com/problems/max-consecutive-ones-iii/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given a binary array nums and an integer k, return the maximum number of consecutive 1's in the array if you can flip at most k 0's.

  

 Example 1:

 Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
 Output: 6
 Explanation: [1,1,1,0,0,1,1,1,1,1,1]
 Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
 Example 2:

 Input: nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3
 Output: 10
 Explanation: [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
 Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
  

 Constraints:

 1 <= nums.length <= 105
 nums[i] is either 0 or 1.
 0 <= k <= nums.length

 */

func longestOnes(_ nums: [Int], _ k: Int) -> Int {
    var flipsLeft = k
    var maxLength = 0
    var lp = 0
    var rp = 0
    while rp < nums.count {
        if nums[rp] == 1 || flipsLeft > 0 {
            if nums[rp] == 0 { flipsLeft -= 1 }
            rp += 1
            continue
        }
        let newMax = (rp - lp)
        if maxLength < newMax { maxLength = newMax }
        if nums[lp] == 0 { flipsLeft += 1 }
        lp += 1
    }
    let newMax = rp - lp
    return max(newMax, maxLength)
}
