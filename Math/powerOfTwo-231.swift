//
//  powerOfTwo-231.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/24/25.
/*
 https://leetcode.com/problems/power-of-two/description/?envType=problem-list-v2&envId=math
 
 Given an integer n, return true if it is a power of two. Otherwise, return false.

 An integer n is a power of two, if there exists an integer x such that n == 2x.

  

 Example 1:

 Input: n = 1
 Output: true
 Explanation: 20 = 1
 Example 2:

 Input: n = 16
 Output: true
 Explanation: 24 = 16
 Example 3:

 Input: n = 3
 Output: false
  

 Constraints:

 -231 <= n <= 231 - 1
  
 */

func isPowerOfTwo(_ n: Int) -> Bool {
    if(n==0)
    {
        return false
    }else{
        return (n&(n-1))==0
    }
    
}
