//
//  sumOfTwoIntegers-371.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/5/25.
/*
 https://leetcode.com/problems/sum-of-two-integers/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given two integers a and b, return the sum of the two integers without using the operators + and -.

  

 Example 1:

 Input: a = 1, b = 2
 Output: 3
 Example 2:

 Input: a = 2, b = 3
 Output: 5
  

 Constraints:

 -1000 <= a, b <= 1000
 */


func getSum(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    while (b != 0) {
        let carry = (a & b) << 1
        a = a ^ b
        b = carry
    }
    return a
}
