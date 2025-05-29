//
//  reverseNumber.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/7/25.
//
/*
 https://leetcode.com/problems/reverse-integer/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

 Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

  

 Example 1:

 Input: x = 123
 Output: 321
 Example 2:

 Input: x = -123
 Output: -321
 Example 3:

 Input: x = 120
 Output: 21
  

 Constraints:

 -231 <= x <= 231 - 1
 */

import Foundation

func reverse(_ x: Int) -> Int {
        var x = x
        var newVal:Int = 0
        while x != 0 {
            newVal = (newVal*10) + (x % 10)
            x /= 10
        }
        return newVal < Int32.min || newVal > Int32.max ? 0 : newVal
}
