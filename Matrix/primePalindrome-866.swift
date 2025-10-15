//
//  primePalindrome-866.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/28/25.
/*
 https://leetcode.com/problems/prime-palindrome/description/?envType=problem-list-v2&envId=math
 
 Given an integer n, return the smallest prime palindrome greater than or equal to n.

 An integer is prime if it has exactly two divisors: 1 and itself. Note that 1 is not a prime number.

 For example, 2, 3, 5, 7, 11, and 13 are all primes.
 An integer is a palindrome if it reads the same from left to right as it does from right to left.

 For example, 101 and 12321 are palindromes.
 The test cases are generated so that the answer always exists and is in the range [2, 2 * 108].

  

 Example 1:

 Input: n = 6
 Output: 7
 Example 2:

 Input: n = 8
 Output: 11
 Example 3:

 Input: n = 13
 Output: 101
  

 Constraints:

 1 <= n <= 108

 */

import Foundation

func primePalindrome(_ N: Int) -> Int {
    // edge case (11 is the only prime palindrome with even number of digits)
    if 8 <= N && N <= 11 { return 11 }
    
    var _N = N
    while true {
        if isPrime(_N) && isPalindrome(String(_N)) { return _N }
        let digits = String(_N).count
        _N = digits % 2 == 0 ? Int(pow(10, Double(digits)) + 1) : _N + 1
    }
    
    func isPrime(_ n: Int) -> Bool {
        guard n > 1 else { return false }
        guard n != 2 else { return true }
        guard n % 2 != 0 else { return false }
        
        var i = 3
        while i * i <= n {
            if n % i == 0 { return false }
            i += 1
        }
        return true
    }
    
    func isPalindrome(_ s: String) -> Bool {
        return s == String(s.reversed())
    }
}
