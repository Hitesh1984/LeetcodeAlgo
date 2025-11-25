//
//  maxProdOf3Numbers-628.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 11/17/25.
/*
 https://leetcode.com/problems/maximum-product-of-three-numbers/description/?envType=problem-list-v2&envId=array
 
 Given an integer array nums, find three numbers whose product is maximum and return the maximum product.

  

 Example 1:

 Input: nums = [1,2,3]
 Output: 6
 Example 2:

 Input: nums = [1,2,3,4]
 Output: 24
 Example 3:

 Input: nums = [-1,-2,-3]
 Output: -6
  

 Constraints:

 3 <= nums.length <= 104
 -1000 <= nums[i] <= 1000
  

 */

func maximumProduct(_ nums: [Int]) -> Int {
    var min1 = Int.max, min2 = Int.max
    var max1 = Int.min, max2 = Int.min, max3 = Int.min
    for n in nums {
        if n <= min1 {
            min2 = min1
            min1 = n
        } else if n < min2 {
            min2 = n
        }
        if n >= max1 {
            max3 = max2
            max2 = max1
            max1 = n
        } else if n >= max2 {
            max3 = max2
            max2 = n
        } else if n >= max3 {
            max3 = n
        }
    }
    return max(min1 * min2 * max1, max1 * max2 * max3)
}
