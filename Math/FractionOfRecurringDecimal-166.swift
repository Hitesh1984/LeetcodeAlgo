//
//  FractionOfRecurringDecimal-166.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/26/25.
/*
 https://leetcode.com/problems/fraction-to-recurring-decimal/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.

 If the fractional part is repeating, enclose the repeating part in parentheses.

 If multiple answers are possible, return any of them.

 It is guaranteed that the length of the answer string is less than 104 for all the given inputs.

  

 Example 1:

 Input: numerator = 1, denominator = 2
 Output: "0.5"
 Example 2:

 Input: numerator = 2, denominator = 1
 Output: "2"
 Example 3:

 Input: numerator = 4, denominator = 333
 Output: "0.(012)"
  

 Constraints:

 -231 <= numerator, denominator <= 231 - 1
 denominator != 0

 */

func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
 
    if numerator == 0 { return "0" }
    var res = [String]()
    
    if numerator < 0 && denominator < 0 {
        // do nothig, because -/- will be always + 
    } else if numerator < 0 {
        res.append("-")
    } else if denominator < 0 {
        res.append("-")
    }
    
    var numerator = abs(numerator)
    var denominator = abs(denominator)
    res.append(String(numerator/denominator))
    numerator %= denominator
    if numerator == 0 {
        return res.joined()
    }
    
    res.append(".")
    var map = [Int:Int]()
    while numerator > 0 {
        numerator *= 10
        res.append(String(numerator/denominator))
        numerator %= denominator
        if let index = map[numerator] {
            res.insert("(", at: index)
            res.append(")")
            break
        } else {
            map[numerator] = res.count
        }
    }
    return res.joined()
}
