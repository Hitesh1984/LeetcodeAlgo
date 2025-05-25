//
//  3Sum.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 3/18/25.
//

import Foundation


/*
 https://leetcode.com/problems/3sum/
 
 Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

 Notice that the solution set must not contain duplicate triplets.

  

 Example 1:

 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Explanation:
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
 The distinct triplets are [-1,0,1] and [-1,-1,2].
 Notice that the order of the output and the order of the triplets does not matter.
 Example 2:

 Input: nums = [0,1,1]
 Output: []
 Explanation: The only possible triplet does not sum up to 0.
 Example 3:

 Input: nums = [0,0,0]
 Output: [[0,0,0]]
 Explanation: The only possible triplet sums up to 0.
  

 Constraints:

 3 <= nums.length <= 3000
 -105 <= nums[i] <= 105

 */

// Input: nums = [-1,0,1,2,-1,-4]
//Output: [[-1,-1,2],[-1,0,1]]

func get3Sum(input:[Int]) -> [[Int]]
{
    var result:[[Int]] = []
    let sortedInput = input.sorted(by: {item1, item2 in
        return item1 < item2
    })
    // [ -4, -1, -1, 0, 1, 2 ]
    let length = sortedInput.count
    for i in stride(from: 0, to: length-1, by: 1) {
        let value = sortedInput[i]
        if (i > 0 && sortedInput[i-1] == value ){
            continue
        }
        var left = i + 1
        var right = sortedInput.count - 1
        while left < right {
            let threeSum:Int = value + sortedInput[left] + sortedInput[right]
            if threeSum > 0 {
                right -= 1
            } else if threeSum < 0 {
                left += 1
            } else {
                result.append([value, sortedInput[left], sortedInput[right]])
                left += 1
                while sortedInput[left] == sortedInput[left-1] && left < right {
                    left += 1
                }
            }
        }
    }
    return result
}
