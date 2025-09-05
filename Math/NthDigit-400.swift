//
//  NthDigit-400.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/28/25.
/*
 
 https://leetcode.com/problems/nth-digit/description/?envType=problem-list-v2&envId=math
 
 Given an integer n, return the nth digit of the infinite integer sequence [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ...].

  

 Example 1:

 Input: n = 3
 Output: 3
 Example 2:

 Input: n = 11
 Output: 0
 Explanation: The 11th digit of the sequence 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ... is a 0, which is part of the number 10.
  

 Constraints:

 1 <= n <= 231 - 1
 */

func findNthDigit(_ n: Int) -> Int {
    var n = n
    var count = 9
    var len = 1
    var start = 1
    while n > count * len { // find range (1..9, 10..99, 100..999 etc)
        n -= count * len
        start += count
        count *= 10
        len += 1
    }
    var reminder = n % len
    var num = 0
    if reminder == 0 {
        num = start + n/len - 1
        return num % 10
    } else {
        num = start + n/len
        var result = -1
        for _ in 0...(len-reminder) {
            result = num % 10
            num = num / 10
        }
        return result
    }
}
