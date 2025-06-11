//
//  smallestDivisorThrshold-1283.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/5/25.

/*
 https://leetcode.com/problems/find-the-smallest-divisor-given-a-threshold/description/?envType=company&envId=amazon&favoriteSlug=amazon-six-months
 
 Given an array of integers nums and an integer threshold, we will choose a positive integer divisor, divide all the array by it, and sum the division's result. Find the smallest divisor such that the result mentioned above is less than or equal to threshold.

 Each result of the division is rounded to the nearest integer greater than or equal to that element. (For example: 7/3 = 3 and 10/2 = 5).

 The test cases are generated so that there will be an answer.

  

 Example 1:

 Input: nums = [1,2,5,9], threshold = 6
 Output: 5
 Explanation: We can get a sum to 17 (1+2+5+9) if the divisor is 1.
 If the divisor is 4 we can get a sum of 7 (1+1+2+3) and if the divisor is 5 the sum will be 5 (1+1+1+2).
 Example 2:

 Input: nums = [44,22,33,11,1], threshold = 5
 Output: 44
  

 Constraints:

 1 <= nums.length <= 5 * 104
 1 <= nums[i] <= 106
 nums.length <= threshold <= 106
 */

import Foundation

func smallestDivisor(_ nums: [Int], _ t: Int) -> Int {
    let srt = nums.map { Double($0) }
    var lhs = 1, rhs = nums.max()!
    var threshold = Double(t)
    func isLessThanThreshold(_ mid:Int)-> Bool {
        var total:Double = 0
        for num in srt {
            total = total + ceil(num / Double(mid) )
            if total > threshold {
                return false
            }
        }
        return true
    }
    while lhs < rhs {
        let mid = lhs + ((rhs-lhs)/2 )
        if isLessThanThreshold(mid) {
            rhs = mid
        } else {
            lhs = mid + 1
        }
    }
    return lhs
}
