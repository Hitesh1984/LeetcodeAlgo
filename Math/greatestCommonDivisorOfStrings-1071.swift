//
//  greatestCommonDivisorOfStrings-1071.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/24/25.
/*
 https://leetcode.com/problems/greatest-common-divisor-of-strings/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 For two strings s and t, we say "t divides s" if and only if s = t + t + t + ... + t + t (i.e., t is concatenated with itself one or more times).

 Given two strings str1 and str2, return the largest string x such that x divides both str1 and str2.

  

 Example 1:

 Input: str1 = "ABCABC", str2 = "ABC"
 Output: "ABC"
 Example 2:

 Input: str1 = "ABABAB", str2 = "ABAB"
 Output: "AB"
 Example 3:

 Input: str1 = "LEET", str2 = "CODE"
 Output: ""
  

 Constraints:

 1 <= str1.length, str2.length <= 1000
 str1 and str2 consist of English uppercase letters.

 */

func gcdOfStrings(_ str1: String, _ str2: String) -> String {
    guard (str1 + str2) == (str2 + str1) else { return "" }
    
    let gcd = gcd(str1.count, str2.count)
    return String(str1.prefix(gcd))
}

func gcd(_ x: Int, _ y: Int) -> Int {
    if y == 0 {
        return x;
    } else {
        return gcd(y, x % y);
    }
}
