//
//  numberOfDigitOne-233.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/3/25.
//

/*
 https://leetcode.com/problems/number-of-digit-one/?envType=problem-list-v2&envId=math
 
 Given an integer n, count the total number of digit 1 appearing in all non-negative integers less than or equal to n.

  

 Example 1:

 Input: n = 13
 Output: 6
 Example 2:

 Input: n = 0
 Output: 0
  

 Constraints:

 0 <= n <= 109
  
 */

func countDigitOne(_ n: Int) -> Int {
    var count = 0
    var factor = 1
    var number = n
    while number > 0 {
        let higher = number / 10   // 1
        let current = number % 10   // 3
        let lower = n - (number * factor)
        count += higher * factor
        if current == 1 {
            count += lower + 1
        } else if current > 1 {
            count += factor
        }
        factor *= 10
        number = higher
    }
    return count
}
