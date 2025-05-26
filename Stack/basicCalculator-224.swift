//
//  basicCalculator-224.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/25/25.

/*
 https://leetcode.com/problems/basic-calculator/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given a string s representing a valid expression, implement a basic calculator to evaluate it, and return the result of the evaluation.

 Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as eval().

  

 Example 1:

 Input: s = "1 + 1"
 Output: 2
 Example 2:

 Input: s = " 2-1 + 2 "
 Output: 3
 Example 3:

 Input: s = "(1+(4+5+2)-3)+(6+8)"
 Output: 23
  

 Constraints:

 1 <= s.length <= 3 * 105
 s consists of digits, '+', '-', '(', ')', and ' '.
 s represents a valid expression.
 '+' is not used as a unary operation (i.e., "+1" and "+(2 + 3)" is invalid).
 '-' could be used as a unary operation (i.e., "-1" and "-(2 + 3)" is valid).
 There will be no two consecutive operators in the input.
 Every number and running calculation will fit in a signed 32-bit integer.
 */

func calculate(_ s: String) -> Int {
    var stack = [Int]()
    var sign = 1
    var partialResult = 0
    var number = 0
    
    for char in s {
        if char.isNumber {
            number *= 10 + char.wholeNumberValue!
        } else if char == "+" || char == "-" {
            partialResult += number * sign
            number = 0
            sign = char == "-" ? -1 : 1
        } else if char == "(" {
            stack.append(partialResult)
            stack.append(sign)
            partialResult = 0
            sign = 1
        } else if char == ")" {
            partialResult += number * sign
            partialResult *= stack.popLast()! // sign
            partialResult += stack.popLast()! // number
        }
    }
    return partialResult + number * sign
}
