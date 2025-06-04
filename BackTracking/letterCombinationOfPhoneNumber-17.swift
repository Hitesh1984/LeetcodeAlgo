//
//  letterCombinationOfPhoneNumber-17.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/6/25.
//
/*
 https://leetcode.com/problems/letter-combinations-of-a-phone-number/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

 A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.


  

 Example 1:

 Input: digits = "23"
 Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
 Example 2:

 Input: digits = ""
 Output: []
 Example 3:

 Input: digits = "2"
 Output: ["a","b","c"]
  

 Constraints:

 0 <= digits.length <= 4
 digits[i] is a digit in the range ['2', '9'].
 
 
 */

import Foundation

func letterCombinations(_ digits: String) -> [String] {
    let map:[Int:[String]] = [
        2: ["a", "b", "c"],
        3: ["d", "e", "f"],
        4: ["g", "h", "i"],
        5: ["j", "k", "l"],
        6: ["m", "n", "o"],
        7: ["p", "q", "r", "s"],
        8: ["t", "u", "v"],
        9: ["w", "x", "y", "z"]
    ]
    var result = [String]()
    var digits = Array(digits)
    func backTrack(_ i:Int, _ curStr:String) {
        if digits.count == curStr.count {
            result.append(curStr)
            return
        }
        guard let val = digits[i].wholeNumberValue else { return }
        for str in map[val, default:[]] {
            backTrack(i+1, curStr+str)
        }
    }
    if !digits.isEmpty {
        backTrack(0, "")
    }
    return result
}
