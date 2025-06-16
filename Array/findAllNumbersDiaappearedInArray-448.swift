//
//  findAllNumbersDiaappearedInArray-448.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/16/25.

/*
 https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums.

  

 Example 1:

 Input: nums = [4,3,2,7,8,2,3,1]
 Output: [5,6]
 Example 2:

 Input: nums = [1,1]
 Output: [2]
  

 Constraints:

 n == nums.length
 1 <= n <= 105
 1 <= nums[i] <= n
  
 */

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    if nums.isEmpty {
        return nums
    }
    return Array(
        Set(1...nums.count).subtracting(nums)
    )
}
