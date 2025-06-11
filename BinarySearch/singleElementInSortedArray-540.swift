//
//  singleElementInSortedArray-540.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/7/25.

/*
 https://leetcode.com/problems/single-element-in-a-sorted-array/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 You are given a sorted array consisting of only integers where every element appears exactly twice, except for one element which appears exactly once.

 Return the single element that appears only once.

 Your solution must run in O(log n) time and O(1) space.

  

 Example 1:

 Input: nums = [1,1,2,3,3,4,4,8,8]
 Output: 2
 Example 2:

 Input: nums = [3,3,7,7,10,11,11]
 Output: 10
  

 Constraints:

 1 <= nums.length <= 105
 0 <= nums[i] <= 105

 */


func singleNonDuplicate(_ nums: [Int]) -> Int {
    var l = 0
    var r = nums.count - 1
    while l < r {
        let m = (l+r)/2  // 4
        if m-1 >= 0 && nums[m-1] != nums[m] && m+1 <= r && nums[m] != nums[m+1] {
            return nums[m]
        }
        if (m+1 <= r && nums[m] == nums[m+1] ) {
            if (m+1) % 2 == 0 {
                r = m-1
            } else {
                l = m+2
            }
        } else if (m-1 >= 0 && nums[m] == nums[m-1] ) {
            if m % 2 == 0 {
                r = m-2
            } else {
                l = m+1
            }
        }
    }
    return nums[l]
}
