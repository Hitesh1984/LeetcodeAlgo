//
//  SQRT-69.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/3/25.

/*
 https://leetcode.com/problems/sqrtx/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.

 You must not use any built-in exponent function or operator.

 For example, do not use pow(x, 0.5) in c++ or x ** 0.5 in python.
  

 Example 1:

 Input: x = 4
 Output: 2
 Explanation: The square root of 4 is 2, so we return 2.
 Example 2:

 Input: x = 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.
  

 Constraints:

 0 <= x <= 231 - 1
 */

func mySqrt(_ x: Int) -> Int {
    guard x > 3 else {return x == 0 ? 0 : 1}
    var (l, r) = (0, x/2)
    
    while l<=r{
        let mid = (l+r)/2
        let res = mid*mid
        
        if res == x{
            return mid
            
        }else{
            res < x ? (l = mid + 1) : (r = mid - 1)
        }
    }
    
    return r
}
