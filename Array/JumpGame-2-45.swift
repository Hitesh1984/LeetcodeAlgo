//
//  JumpGame-2.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 3/20/25.
//

import Foundation

/*
 https://leetcode.com/problems/jump-game-ii/
 
 You are given a 0-indexed array of integers nums of length n. You are initially positioned at nums[0].

 Each element nums[i] represents the maximum length of a forward jump from index i. In other words, if you are at nums[i], you can jump to any nums[i + j] where:

 0 <= j <= nums[i] and
 i + j < n
 Return the minimum number of jumps to reach nums[n - 1]. The test cases are generated such that you can reach nums[n - 1].

  

 Example 1:

 Input: nums = [2,3,1,1,4]
 Output: 2
 Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Example 2:

 Input: nums = [2,3,0,1,4]
 Output: 2
  

 Constraints:

 1 <= nums.length <= 104
 0 <= nums[i] <= 1000
 It's guaranteed that you can reach nums[n - 1].

 */

/*
func canJump2(_ nums:[Int]) -> Int {
    var res = 0
    var left = 0
    var right = 0
    
    while right < nums.count  {
        var farthest = 0
        for iteration in Range(left...right+1) {
            farthest = max(farthest, iteration + nums[iteration])
            print(farthest)
        }
        left = right + 1
        right = farthest
        res += 1
        print("left = \(left), right = \(right) , result = \(res) ")
    }
    return res
}
*/

/*
 Though the definition confirmed that we would reach nums[n-1], but I added one test case if it can not reach nums[n-1], so return -1.
 */
func canJump2(_ nums:[Int]) -> Int {
    
    if nums.count == 1 {
        return 0
    }
    var jumps = 0
    var currentEnd = 0
    var farthest = 0
    var iteration = 0
    while iteration < nums.count-1 {
        
        farthest = max(farthest, iteration + nums[iteration])
        if (iteration == currentEnd) {
            jumps += 1
            currentEnd = farthest;
        }
        if currentEnd == nums.count - 1 {
            return jumps
        }
        iteration += 1
    }
    if currentEnd == nums.count - 1 {
        return jumps
    } else {
        return -1
    }
   
    
}

