//
//  uglyNumber-263.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/24/25.
/*
 https://leetcode.com/problems/ugly-number/description/?envType=problem-list-v2&envId=math
 
 An ugly number is a positive integer which does not have a prime factor other than 2, 3, and 5.

 Given an integer n, return true if n is an ugly number.

  

 Example 1:

 Input: n = 6
 Output: true
 Explanation: 6 = 2 × 3
 Example 2:

 Input: n = 1
 Output: true
 Explanation: 1 has no prime factors.
 Example 3:

 Input: n = 14
 Output: false
 Explanation: 14 is not ugly since it includes the prime factor 7.
  

 Constraints:

 -231 <= n <= 231 - 1

 */

func isUgly(_ n: Int) -> Bool {
    
    if n <= 0 {return false}
    
    var num = n
    
    while num != 1 {
        if num % 2 == 0 {
            num /= 2
        }
        else if num % 3 == 0 {
            num /= 3
        }
        else if num % 5 == 0 {
            num /= 5
        }
        else {return false}
    }
    return true
}
