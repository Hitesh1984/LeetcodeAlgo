//
//  NumberOf1Bits-191.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/23/25.
/*
 https://leetcode.com/problems/number-of-1-bits/description/?envType=company&envId=yahoo&favoriteSlug=yahoo-more-than-six-months
 
 Given a positive integer n, write a function that returns the number of set bits in its binary representation (also known as the Hamming weight).

  

 Example 1:

 Input: n = 11

 Output: 3

 Explanation:

 The input binary string 1011 has a total of three set bits.

 Example 2:

 Input: n = 128

 Output: 1

 Explanation:

 The input binary string 10000000 has a total of one set bit.

 Example 3:

 Input: n = 2147483645

 Output: 30

 Explanation:

 The input binary string 1111111111111111111111111111101 has a total of thirty set bits.

  

 Constraints:

 1 <= n <= 231 - 1
  
 */

func hammingWeight(_ n: Int) -> Int {
    var n = n, result = 0
    while n != 0 {
        result += n & 1
        n >>= 1
    }
    return result
}
