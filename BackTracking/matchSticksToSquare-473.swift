//
//  matchSticksToSquare-473.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 11/12/25.
/*
 https://leetcode.com/problems/matchsticks-to-square/description/?envType=problem-list-v2&envId=array
 
 You are given an integer array matchsticks where matchsticks[i] is the length of the ith matchstick. You want to use all the matchsticks to make one square. You should not break any stick, but you can link them up, and each matchstick must be used exactly one time.

 Return true if you can make this square and false otherwise.

  

 Example 1:


 Input: matchsticks = [1,1,2,2,2]
 Output: true
 Explanation: You can form a square with length 2, one side of the square came two sticks with length 1.
 Example 2:

 Input: matchsticks = [3,3,3,3,4]
 Output: false
 Explanation: You cannot find a way to form a square with all the matchsticks.
  

 Constraints:

 1 <= matchsticks.length <= 15
 1 <= matchsticks[i] <= 108
 */

/*
 func makesquare(_ nums: [Int]) -> Bool {
 var count = nums.count
 let sc = 4
 if count < sc { return false }
 var sides = [Int](repeating: 0, count: sc)
 var sum = nums.reduce(0, +)
 var target = sum / sc
 if sum % sc != 0 { return false }
 let nums = nums.sorted(by: >)
 
 func helper(_ start: Int) -> Bool {
 for i in 0..<sc where sides[i] + nums[start] <= target {
 sides[i] += nums[start]
 if start < count - 1 {
 if helper(start + 1) { return true }
 } else {
 if sides.allSatisfy { $0 == target } { return true }
 }
 sides[i] -= nums[start]
 }
 return false
 }
 return helper(0)
 }
 */

func makesquare(_ nums: [Int]) -> Bool {
    var count = nums.count
    var sc = 4
    if count < sc { return false }
    var sum = nums.reduce(0, +)
    var target = sum / sc
    if sum % sc != 0 { return false }
    let nums = nums.sorted(by: >)
    // Below lines of codes make more readable more understandable code.
    // let nums = nums.filter({$0 != target}).sorted(by: >)
    // sc -= (count - nums.count)
    // if sc == 0 { return true }
    // if sc == 1 {
    //     if nums.reduce(0, +) == target { return true } else { return false }
    // }
    // count = nums.count
    var sides = [Int](repeating: 0, count: sc)
    func helper(_ start: Int) -> Bool {
        for i in 0..<sc where sides[i] + nums[start] <= target {
            sides[i] += nums[start]
            if start < count - 1 {
                if helper(start + 1) { return true }
            } else {
                if sides.allSatisfy({ $0 == target }) { return true }
            }
            sides[i] -= nums[start]
        }
        return false
    }
    return helper(0)
}
