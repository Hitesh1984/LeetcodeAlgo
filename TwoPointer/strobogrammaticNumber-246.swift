//
//  strobogrammaticNumber-246.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/21/25.
/*
 https://leetcode.com/problems/strobogrammatic-number/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given a string num which represents an integer, return true if num is a strobogrammatic number.

 A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).

  

 Example 1:

 Input: num = "69"
 Output: true
 Example 2:

 Input: num = "88"
 Output: true
 Example 3:

 Input: num = "962"
 Output: false
  

 Constraints:

 1 <= num.length <= 50
 num consists of only digits.
 num does not contain any leading zeros except for zero itself.

 */

func isStrobogrammatic(_ num: String) -> Bool {
    guard num.count > 1 else {
        return num == "8" || num == "0" || num == "1"
    }
    var map: [Character: Character] = [
        "6": "9",
        "0": "0",
        "1": "1",
        "8": "8",
        "9": "6"
    ]
    
    var left = 0
    var right = num.count-1
    var numArray = Array(num)
    while left <= right {
        //if map[numArray[right], default: "S" ] != numArray[left] {
        if map[numArray[left], default: "S" ] != numArray[right] {
            return false
        }
        right -= 1
        left += 1
    }
    return true
}
