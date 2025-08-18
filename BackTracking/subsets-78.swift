//
//  subsets-78.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/5/25.
/*
 
 https://leetcode.com/problems/subsets/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given an integer array nums of unique elements, return all possible subsets (the power set).

 The solution set must not contain duplicate subsets. Return the solution in any order.

  

 Example 1:

 Input: nums = [1,2,3]
 Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
 Example 2:

 Input: nums = [0]
 Output: [[],[0]]
  

 Constraints:

 1 <= nums.length <= 10
 -10 <= nums[i] <= 10
 All the numbers of nums are unique.

 */

import Foundation

func subsets(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 0 else { return [] }
    var result = [[Int]]()
    var candidates = [Int]()
    backTracking(0)
    return result
    
    func backTracking( _ startIndex: Int) {
        for i in startIndex..<nums.count {
            candidates.append(nums[i])
            backTracking(i+1)
            candidates.removeLast()
        }
        result.append(candidates)
    }
}
