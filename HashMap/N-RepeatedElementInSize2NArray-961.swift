//
//  N-RepeatedElementInSize2NArray-961.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/21/25.
/*
 https://leetcode.com/problems/n-repeated-element-in-size-2n-array/description/?envType=problem-list-v2&envId=hash-table
 
 You are given an integer array nums with the following properties:

 nums.length == 2 * n.
 nums contains n + 1 unique elements.
 Exactly one element of nums is repeated n times.
 Return the element that is repeated n times.

  

 Example 1:

 Input: nums = [1,2,3,3]
 Output: 3
 Example 2:

 Input: nums = [2,1,2,5,3,2]
 Output: 2
 Example 3:

 Input: nums = [5,1,5,2,5,3,5,4]
 Output: 5
  

 Constraints:

 2 <= n <= 5000
 nums.length == 2 * n
 0 <= nums[i] <= 104
 nums contains n + 1 unique elements and one of them is repeated exactly n times.

 */

func repeatedNTimes(_ nums: [Int]) -> Int {
    var map = [Int:Int]()
    var highest = 0
    var highestNum = nums[0]
    for num in nums {
        map[num, default:0] += 1
        if highest < map[num, default:0] {
            highest =  map[num, default:0]
            highestNum = num
        }
        
    }
    return highestNum
}
