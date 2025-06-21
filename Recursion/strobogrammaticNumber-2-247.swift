//
//  strobogrammaticNumber-2-247.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/21/25.
/*
 https://leetcode.com/problems/strobogrammatic-number-ii/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given an integer n, return all the strobogrammatic numbers that are of length n. You may return the answer in any order.

 A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).

  

 Example 1:

 Input: n = 2
 Output: ["11","69","88","96"]
 Example 2:

 Input: n = 1
 Output: ["0","1","8"]
  

 Constraints:

 1 <= n <= 14
 */

func findStrobogrammatic(_ n: Int) -> [String] {
    let original = n
    func backtrack(_ n: Int) -> [String] {
        if n == 0 { return [""] }
        if n == 1 { return ["0", "1", "8"]}
        
        let prevResults = backtrack(n - 2)
        var result = [String]()
        for prevResult in prevResults {
            if n != original { result.append("0\(prevResult)0") }
            result.append("1\(prevResult)1")
            result.append("8\(prevResult)8")
            result.append("6\(prevResult)9")
            result.append("9\(prevResult)6")
        }
        return result
    }
    return backtrack(n)
}
