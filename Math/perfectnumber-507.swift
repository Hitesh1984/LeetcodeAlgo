//
//  perfectnumber-507.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/28/25.
/*
 https://leetcode.com/problems/perfect-number/description/?envType=problem-list-v2&envId=math
 
 A perfect number is a positive integer that is equal to the sum of its positive divisors, excluding the number itself. A divisor of an integer x is an integer that can divide x evenly.

 Given an integer n, return true if n is a perfect number, otherwise return false.

  

 Example 1:

 Input: num = 28
 Output: true
 Explanation: 28 = 1 + 2 + 4 + 7 + 14
 1, 2, 4, 7, and 14 are all divisors of 28.
 Example 2:

 Input: num = 7
 Output: false
  

 Constraints:

 1 <= num <= 108

 */



func checkPerfectNumber(_ num: Int) -> Bool {
    if num == 1 { return false }
    var sum = 0
    for i in 1...num / 2 where num % i == 0 {
        sum += i
    }
    return sum == num
}
