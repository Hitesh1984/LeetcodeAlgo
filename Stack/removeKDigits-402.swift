//
//  File.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/11/25.

/*
 https://leetcode.com/problems/remove-k-digits/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given string num representing a non-negative integer num, and an integer k, return the smallest possible integer after removing k digits from num.

  

 Example 1:

 Input: num = "1432219", k = 3
 Output: "1219"
 Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
 Example 2:

 Input: num = "10200", k = 1
 Output: "200"
 Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
 Example 3:

 Input: num = "10", k = 2
 Output: "0"
 Explanation: Remove all the digits from the number and it is left with nothing which is 0.
  

 Constraints:

 1 <= k <= num.length <= 105
 num consists of only digits.
 num does not have any leading zeros except for the zero itself.

 */

func removeKdigits(_ num: String, _ k: Int) -> String {
    var count = k
    var result = ""
    let arr: [Int] = num.map{Int(String($0))!}
    var stack: [Int] = []
    for i in arr {
        while let last = stack.last, i < last, count > 0 {
            stack.removeLast()
            count -= 1
        }
        if stack.isEmpty && i == 0 {
            continue
        }
        stack.append(i)
    }
    
    while count > 0 && !stack.isEmpty{
        stack.removeLast()
        count -= 1
    }
    result = stack.map{String($0)}.joined()
    return result == "" ? "0" : result
}
