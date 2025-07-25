//
//  132Pattern-456.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/4/25.
/*
 https://leetcode.com/problems/132-pattern/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an array of n integers nums, a 132 pattern is a subsequence of three integers nums[i], nums[j] and nums[k] such that i < j < k and nums[i] < nums[k] < nums[j].

 Return true if there is a 132 pattern in nums, otherwise, return false.

  

 Example 1:

 Input: nums = [1,2,3,4]
 Output: false
 Explanation: There is no 132 pattern in the sequence.
 Example 2:

 Input: nums = [3,1,4,2]
 Output: true
 Explanation: There is a 132 pattern in the sequence: [1, 4, 2].
 Example 3:

 Input: nums = [-1,3,2,0]
 Output: true
 Explanation: There are three 132 patterns in the sequence: [-1, 3, 2], [-1, 3, 0] and [-1, 2, 0].
  

 Constraints:

 n == nums.length
 1 <= n <= 2 * 105
 -109 <= nums[i] <= 109
 
 */

func find132pattern(_ nums: [Int]) -> Bool {
    var stack = [[Int]]() // [j, minValue]
    var currMin = nums[0] // current minValue
    
    for k in 1..<nums.count {
        while !stack.isEmpty && stack.last![0] < nums[k] {
            stack.removeLast()
        }
        if !stack.isEmpty && nums[k] > stack.last![1] && nums[k] < stack.last![0] {
            return true
        }
        stack.append([nums[k], currMin])
        currMin = min(currMin, nums[k])
    }
    return false
}
