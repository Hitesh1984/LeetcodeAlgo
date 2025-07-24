//
//  BasicCalculator-2-227.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/8/25.

/*
 https://leetcode.com/problems/basic-calculator-ii/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given a string s which represents an expression, evaluate this expression and return its value.

 The integer division should truncate toward zero.

 You may assume that the given expression is always valid. All intermediate results will be in the range of [-231, 231 - 1].

 Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as eval().

  

 Example 1:

 Input: s = "3+2*2"
 Output: 7
 Example 2:

 Input: s = " 3/2 "
 Output: 1
 Example 3:

 Input: s = " 3+5 / 2 "
 Output: 5
  

 Constraints:

 1 <= s.length <= 3 * 105
 s consists of integers and operators ('+', '-', '*', '/') separated by some number of spaces.
 s represents a valid expression.
 All the integers in the expression are non-negative integers in the range [0, 231 - 1].
 The answer is guaranteed to fit in a 32-bit integer.
 */


import Foundation

func calculate2(_ s: String) -> Int {
    var num = 0
    var stack = [Int]()
    var op = "+"
    for char in s+"A" where char != " " {
        if let number = char.wholeNumberValue {
            num = num * 10 + number
        } else {
            switch op {
            case "+":
                stack.append(num)
            case "-":
                stack.append(-num)
            case "*":
                stack.append(stack.removeLast() * num)
            case "/":
                stack.append(stack.removeLast() / num)
            default: break
            }
            num = 0
            op = String(char)
        }
    }
    return stack.reduce(0, +)
}
