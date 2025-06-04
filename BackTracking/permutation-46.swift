//
//  permutation-46.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/26/25.

/*
 https://leetcode.com/problems/permutations/description/
 
 Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

  

 Example 1:

 Input: nums = [1,2,3]
 Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 Example 2:

 Input: nums = [0,1]
 Output: [[0,1],[1,0]]
 Example 3:

 Input: nums = [1]
 Output: [[1]]
  

 Constraints:

 1 <= nums.length <= 6
 -10 <= nums[i] <= 10
 All the integers of nums are unique.

 */

func permute(_ nums: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    
    func backtrack(_ nums: [Int], _ path: [Int]) {
        if nums.isEmpty {
            result.append(path)
            return
        }
        for i in 0..<nums.count {
            var newNums = nums
            newNums.remove(at: i)
            backtrack(newNums, path + [nums[i]])
        }
    }
    
    backtrack(nums, [])
    return result
}
