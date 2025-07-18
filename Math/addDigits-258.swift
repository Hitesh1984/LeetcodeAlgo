//
//  addDigits-258.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/15/25.
/*
 https://leetcode.com/problems/add-digits/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an integer num, repeatedly add all its digits until the result has only one digit, and return it.

  

 Example 1:

 Input: num = 38
 Output: 2
 Explanation: The process is
 38 --> 3 + 8 --> 11
 11 --> 1 + 1 --> 2
 Since 2 has only one digit, return it.
 Example 2:

 Input: num = 0
 Output: 0
  

 Constraints:

 0 <= num <= 231 - 1
 */

func addDigits(_ num: Int) -> Int {
    var num = num
    var sum = 0
    var firstTime = true
    while firstTime || sum > 9 {
        if !firstTime { num = sum }
        sum = 0
        while num > 0 {
            sum += num%10
            num /= 10
        }
        firstTime = false
    }
    return sum
}
