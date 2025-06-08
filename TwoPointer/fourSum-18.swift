//
//  fourSum.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/5/25.
//

/*
 https://leetcode.com/problems/4sum/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:

 0 <= a, b, c, d < n
 a, b, c, and d are distinct.
 nums[a] + nums[b] + nums[c] + nums[d] == target
 You may return the answer in any order.

  

 Example 1:

 Input: nums = [1,0,-1,0,-2,2], target = 0
 Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 Example 2:

 Input: nums = [2,2,2,2,2], target = 8
 Output: [[2,2,2,2]]
  

 Constraints:

 1 <= nums.length <= 200
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 
 */

import Foundation
// Input: nums = [1,0,-1,0,-2,2], target = 0
// Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
// [2,2,2,2]
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
       let sorted = nums.sorted() // [-2,-1,0,0,-1,-2]
       var res: [[Int]] = []
       var i = 0
       
       while i < sorted.count - 3 {
           if i > 0, sorted[i] == sorted[i - 1] { i += 1; continue }
           var j = i + 1 // 1
           while j < sorted.count - 2 {
               if j - 1 > i, sorted[j] == sorted[j - 1] { j += 1; continue }
               var k = j + 1 // 2
               var l = sorted.count - 1 // 3
               
               while k < l {
                   let sum = sorted[i] + sorted[j] + sorted[k] + sorted[l]
                   if sum == target {
                       if k - 1 > j, sorted[k] == sorted[k - 1] { k += 1; continue }
                       res.append([sorted[i], sorted[j], sorted[k], sorted[l]])
                       k += 1
                   }else if sum < target {
                       k += 1
                   } else {
                       l -= 1
                   }
               }
               j += 1
           }
           i += 1
       }

       return res
   }
