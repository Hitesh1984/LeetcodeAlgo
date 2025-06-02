//
//  maximumFreqAfterSubarrayOperation.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/24/25.
/*
 https://leetcode.com/problems/maximum-frequency-after-subarray-operation/description/
 
 You are given an array nums of length n. You are also given an integer k.

 You perform the following operation on nums once:

 Select a subarray nums[i..j] where 0 <= i <= j <= n - 1.
 Select an integer x and add x to all the elements in nums[i..j].
 Find the maximum frequency of the value k after the operation.

  

 Example 1:

 Input: nums = [1,2,3,4,5,6], k = 1

 Output: 2

 Explanation:

 After adding -5 to nums[2..5], 1 has a frequency of 2 in [1, 2, -2, -1, 0, 1].

 Example 2:

 Input: nums = [10,2,3,4,5,5,4,3,2,2], k = 10

 Output: 4

 Explanation:

 After adding 8 to nums[1..9], 10 has a frequency of 4 in [10, 10, 11, 12, 13, 13, 12, 11, 10, 10].

  

 Constraints:

 1 <= n == nums.length <= 105
 1 <= nums[i] <= 50
 1 <= k <= 50
 */

func maxFreqTestCases() {
    let res = maxFrequency([4,6,6,4,6,6], 4)
    print(res)
    let res1 = maxFrequency([5,2,5,2,5,2], 2)
    print(res1)
}

func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
    var map = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    func kadane(_ key:Int) -> Int {
        var res = 0
        var cur = 0
        for num in nums {
            if num == k { cur -= 1 }
            if num == key { cur += 1 }
            if cur < 0 { cur = 0 }
            res = max(res,cur)
        }
        return res
    }
    var res = 0
    for key in map.keys where key != k {
        res = max(res, kadane(key))
    }
    return map[k, default:0] + res
}
