//
//  sortArrayByParity-905.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/2/25.
/*
 https://leetcode.com/problems/sort-array-by-parity/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given an integer array nums, move all the even integers at the beginning of the array followed by all the odd integers.

 Return any array that satisfies this condition.

  

 Example 1:

 Input: nums = [3,1,2,4]
 Output: [2,4,3,1]
 Explanation: The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
 Example 2:

 Input: nums = [0]
 Output: [0]
  

 Constraints:

 1 <= nums.length <= 5000
 0 <= nums[i] <= 5000
 */

func sortArrayByParity(_ nums: [Int]) -> [Int] {
    var nums = nums
    var evenInd = 0
    var ind = nums.count-1
    while ind >= evenInd {
        if nums[ind] % 2 == 0 {
            nums.swapAt(evenInd,ind)
            if nums[ind] % 2 == 0 {
                ind += 1
            }
            evenInd += 1
        }
        ind -= 1
    }
    return nums
}
