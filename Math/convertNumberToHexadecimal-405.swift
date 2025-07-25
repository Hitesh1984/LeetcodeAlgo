//
//  convertNumberToHexadecimal-405.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/24/25.
/*
 https://leetcode.com/problems/convert-a-number-to-hexadecimal/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given a 32-bit integer num, return a string representing its hexadecimal representation. For negative integers, two’s complement method is used.

 All the letters in the answer string should be lowercase characters, and there should not be any leading zeros in the answer except for the zero itself.

 Note: You are not allowed to use any built-in library method to directly solve this problem.

  

 Example 1:

 Input: num = 26
 Output: "1a"
 Example 2:

 Input: num = -1
 Output: "ffffffff"
  

 Constraints:

 -231 <= num <= 231 - 1

 */
import Foundation

func toHex2(_ num: Int) -> String {
    var hexa = String()
    var hexaNums:[String] = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"]
    var n = num
    if num < 0 {
        n += Int(pow(Double(2),Double(32)))
    }
    while n >= 0 {
        let d = n % 16
        hexa = hexaNums[d] + hexa
        if n / 16 == 0{
            break
        }
        n /= 16
    }
    return hexa
}
