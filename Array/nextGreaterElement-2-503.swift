//
//  nextGreaterElement-2-503.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/26/25.

/*
 https://leetcode.com/problems/next-greater-element-ii/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given a circular integer array nums (i.e., the next element of nums[nums.length - 1] is nums[0]), return the next greater number for every element in nums.

 The next greater number of a number x is the first greater number to its traversing-order next in the array, which means you could search circularly to find its next greater number. If it doesn't exist, return -1 for this number.

  

 Example 1:

 Input: nums = [1,2,1]
 Output: [2,-1,2]
 Explanation: The first 1's next greater number is 2;
 The number 2 can't find next greater number.
 The second 1's next greater number needs to search circularly, which is also 2.
 Example 2:

 Input: nums = [1,2,3,4,3]
 Output: [2,3,4,-1,4]
  

 Constraints:

 1 <= nums.length <= 104
 -109 <= nums[i] <= 109
 */

func nextGreaterElements(_ nums: [Int]) -> [Int] {
    var ret = [Int]()
    func firstPositiveOf(_ num: Int, _ index:Int ) -> Int {
        var ret = -1
        for i in index+1..<nums.count {
            if num < nums[i] {
                return nums[i]
            }
        }
        if index > 0 {
            for i in 0...index-1 {
                if num < nums[i] {
                    return nums[i]
                }
            }
        }
        return ret
    }
    for (index,num) in nums.enumerated() {
        ret.append(firstPositiveOf(num, index))
    }
    return ret
}
