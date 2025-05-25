//
//  JumpGame-1.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 3/20/25.
//

import Foundation

/*
 https://leetcode.com/problems/jump-game/description/
 
 You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.

 Return true if you can reach the last index, or false otherwise.

  

 Example 1:

 Input: nums = [2,3,1,1,4]
 Output: true
 Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Example 2:

 Input: nums = [3,2,1,0,4]
 Output: false
 Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
  

 Constraints:

 1 <= nums.length <= 104
 0 <= nums[i] <= 105

 */

/*
func canJump(input:[Int]) -> Bool {
    
    var goal = input.count - 1
    //[3,2,1,0,4]
    for iteration in stride(from: input.count-1, through: 0, by: -1) {
        print(iteration)
        print(input[iteration])
        if iteration + input[iteration] >= goal {
            goal = iteration
        }
    }
    return (goal == 0)
}
 */


func canJump(_ nums: [Int]) -> Bool {
    let length = nums.count - 1
    var maxReachable:Int = 0
    for (index,value) in nums.enumerated() {
        if index > maxReachable {
            return false
        }
        maxReachable = max(maxReachable, index+value)
        if maxReachable == length {
            return true
        }
    }
    return true
}
