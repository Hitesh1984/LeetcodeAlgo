//
//  addString-415.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/17/25.
/*
 https://leetcode.com/problems/add-strings/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string.

 You must solve the problem without using any built-in library for handling large integers (such as BigInteger). You must also not convert the inputs to integers directly.

  

 Example 1:

 Input: num1 = "11", num2 = "123"
 Output: "134"
 Example 2:

 Input: num1 = "456", num2 = "77"
 Output: "533"
 Example 3:

 Input: num1 = "0", num2 = "0"
 Output: "0"
  

 Constraints:

 1 <= num1.length, num2.length <= 104
 num1 and num2 consist of only digits.
 num1 and num2 don't have any leading zeros except for the zero itself.
 */

func addStrings(_ num1: String, _ num2: String) -> String {
    var carry = 0
    let num1 = Array(num1)
    let num2 = Array(num2)
    var index = 0
    var result = ""
    for (n1, n2) in zip(num1.reversed(), num2.reversed()) {
        index += 1
        let calc = (n1.wholeNumberValue ?? 0) + (n2.wholeNumberValue ?? 0)  + carry
        result = "\(calc % 10)" + result
        carry = calc / 10
    }
    if num1.count > index { addReminderDigit(left: num1) }
    if num2.count > index { addReminderDigit(left: num2) }
    
    func addReminderDigit(left:[Character]) {
        while left.count - index > 0 {
            index += 1
            let calc = ( left[left.count-index].wholeNumberValue ?? 0 ) + carry
            result = "\(calc % 10)" + result
            carry = calc / 10
        }
    }
    
    if (carry > 0) {
        result = "\(carry)" + result;
    }
    return result
}
