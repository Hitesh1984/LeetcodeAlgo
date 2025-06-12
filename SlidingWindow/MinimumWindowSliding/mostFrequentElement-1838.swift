//
//  mostFrequentElement-1838.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/8/25.

/*
 https://leetcode.com/problems/frequency-of-the-most-frequent-element/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 The frequency of an element is the number of times it occurs in an array.

 You are given an integer array nums and an integer k. In one operation, you can choose an index of nums and increment the element at that index by 1.

 Return the maximum possible frequency of an element after performing at most k operations.

  

 Example 1:

 Input: nums = [1,2,4], k = 5
 Output: 3
 Explanation: Increment the first element three times and the second element two times to make nums = [4,4,4].
 4 has a frequency of 3.
 Example 2:

 Input: nums = [1,4,8,13], k = 5
 Output: 2
 Explanation: There are multiple optimal solutions:
 - Increment the first element three times to make nums = [4,4,8,13]. 4 has a frequency of 2.
 - Increment the second element four times to make nums = [1,8,8,13]. 8 has a frequency of 2.
 - Increment the third element five times to make nums = [1,4,13,13]. 13 has a frequency of 2.
 Example 3:

 Input: nums = [3,9,6], k = 2
 Output: 1
  

 Constraints:

 1 <= nums.length <= 105
 1 <= nums[i] <= 105
 1 <= k <= 105

 */

func maxFrequencyElement(_ nums: [Int], _ k: Int) -> Int
{
    let nums = nums.sorted()
    var left = 0
    var sum = 0
    for (right, num) in nums.enumerated() {
        sum += num
        if (right - left + 1)*num - sum > k {
            sum -= nums[left]
            left += 1
        }
    }
    return nums.count - left
}
