//
//  BitManipulation-397.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/5/25.

/*
 https://leetcode.com/problems/integer-replacement/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given a positive integer n, you can apply one of the following operations:

 If n is even, replace n with n / 2.
 If n is odd, replace n with either n + 1 or n - 1.
 Return the minimum number of operations needed for n to become 1.

  

 Example 1:

 Input: n = 8
 Output: 3
 Explanation: 8 -> 4 -> 2 -> 1
 Example 2:

 Input: n = 7
 Output: 4
 Explanation: 7 -> 8 -> 4 -> 2 -> 1
 or 7 -> 6 -> 3 -> 2 -> 1
 Example 3:

 Input: n = 4
 Output: 2
  

 Constraints:

 1 <= n <= 231 - 1

 */

func integerReplacement23(_ n: Int) -> Int {
    var steps = 0
    var num = n
    while num != 1 {
        if num % 2 == 0 {
            num = num / 2
        } else {
            if (num+1) % 4 == 0 && num-1 != 2 {
                num += 1
            } else {
                num -= 1
            }
        }
        steps += 1
    }
    return steps
}
