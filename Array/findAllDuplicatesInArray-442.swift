//
//  findAllDuplicatesInArray-442.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 11/10/25.
/*
 https://leetcode.com/problems/find-all-duplicates-in-an-array/description/?envType=problem-list-v2&envId=array
 
 Given an integer array nums of length n where all the integers of nums are in the range [1, n] and each integer appears at most twice, return an array of all the integers that appears twice.

 You must write an algorithm that runs in O(n) time and uses only constant auxiliary space, excluding the space needed to store the output

  

 Example 1:

 Input: nums = [4,3,2,7,8,2,3,1]
 Output: [2,3]
 Example 2:

 Input: nums = [1,1,2]
 Output: [1]
 Example 3:

 Input: nums = [1]
 Output: []
  

 Constraints:

 n == nums.length
 1 <= n <= 105
 1 <= nums[i] <= n
 Each element in nums appears once or twice.

 */

func findDuplicates(_ nums: [Int]) -> [Int] {
    var nums = nums
    var result = [Int]()
    for num in nums {
        nums[num - 1] *= -1
        if nums[num - 1] > .zero {
            result.append(num)
        }
    }
    return result
}
