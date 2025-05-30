//
//  isPalinmromeNumber-9.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/7/25.
//
/*
 https://leetcode.com/problems/palindrome-number/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an integer x, return true if x is a palindrome, and false otherwise.
 
 
 
 Example 1:
 
 Input: x = 121
 Output: true
 Explanation: 121 reads as 121 from left to right and from right to left.
 Example 2:
 
 Input: x = -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 Example 3:
 
 Input: x = 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
 
 
 Constraints:
 
 -231 <= x <= 231 - 1
 
 
 Follow up: Could you solve it without converting the integer to a string?
 
 */

import Foundation

func isPalindrome(_ x: Int) -> Bool {
    
    return x < 0 ? false : reverse(x) == x
    /*
    func reverse(_ x: Int) -> Int {
        var x = x
        var newVal:Int = 0
        while x != 0 {
            newVal = (newVal*10) + (x % 10)
            x /= 10
        }
        return newVal < Int32.min || newVal > Int32.max ? 0 : newVal
    }
     */
}
