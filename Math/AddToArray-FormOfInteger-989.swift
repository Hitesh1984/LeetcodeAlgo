//
//  AddToArray-FormOfInteger-989.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/25/25.
/*
 https://leetcode.com/problems/add-to-array-form-of-integer/description/?envType=problem-list-v2&envId=math
 
 The array-form of an integer num is an array representing its digits in left to right order.

 For example, for num = 1321, the array form is [1,3,2,1].
 Given num, the array-form of an integer, and an integer k, return the array-form of the integer num + k.

  

 Example 1:

 Input: num = [1,2,0,0], k = 34
 Output: [1,2,3,4]
 Explanation: 1200 + 34 = 1234
 Example 2:

 Input: num = [2,7,4], k = 181
 Output: [4,5,5]
 Explanation: 274 + 181 = 455
 Example 3:

 Input: num = [2,1,5], k = 806
 Output: [1,0,2,1]
 Explanation: 215 + 806 = 1021
  

 Constraints:

 1 <= num.length <= 104
 0 <= num[i] <= 9
 num does not contain any leading zeros except for the zero itself.
 1 <= k <= 104

 */

func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {
    var result: [Int] = [], carry = k
    var idx = num.count - 1
    
    while idx >= 0 || carry > 0 {
        let dig = idx >= 0 ? num[idx] : 0
        let sum = carry + dig
        result.append(sum % 10)
        carry = sum / 10
        idx -= 1
    }
    return result.reversed()
}
