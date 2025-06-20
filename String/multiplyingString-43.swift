//
//  multiplyingString-43.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/20/25.
/*
 https://leetcode.com/problems/multiply-strings/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

 Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.

  

 Example 1:

 Input: num1 = "2", num2 = "3"
 Output: "6"
 Example 2:

 Input: num1 = "123", num2 = "456"
 Output: "56088"
  

 Constraints:

 1 <= num1.length, num2.length <= 200
 num1 and num2 consist of digits only.
 Both num1 and num2 do not contain any leading zero, except the number 0 itself.

 */

func multiply(_ num1: String, _ num2: String) -> String {
    var sum = [Int](repeating: 0, count: num1.count + num2.count)
    for (i, n1) in num1.enumerated().reversed() {
        for (j, n2) in num2.enumerated().reversed() {
            let p1 = i + j
            let p2 = i + j + 1
            let mult = n1.wholeNumberValue! * n2.wholeNumberValue! + sum[p2] // add in carry from before
            sum[p2] = mult % 10
            sum[p1] += mult / 10
        }
    }
    while let firstSum = sum.first, firstSum == 0 { sum.removeFirst() }
    let res = sum.map ({ String($0) }).joined()
    return res.count > 0 ? res : "0"
}
