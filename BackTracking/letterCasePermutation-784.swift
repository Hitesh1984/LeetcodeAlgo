//
//  letterCasePermutation-784.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/29/25.
/*
 https://leetcode.com/problems/letter-case-permutation/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given a string s, you can transform every letter individually to be lowercase or uppercase to create another string.

 Return a list of all possible strings we could create. Return the output in any order.

  

 Example 1:

 Input: s = "a1b2"
 Output: ["a1b2","a1B2","A1b2","A1B2"]
 Example 2:

 Input: s = "3z4"
 Output: ["3z4","3Z4"]
  

 Constraints:

 1 <= s.length <= 12
 s consists of lowercase English letters, uppercase English letters, and digits.
 */

func letterCasePermutation(_ s: String) -> [String] {
    let arr = Array(s)
    var result = [String]()
    
    func bt(_ idx: Int, _ curr: Array<Character>) {
        if idx == arr.count {
            result.append(String(curr))
            return
        }
        bt(idx+1, curr)
        if !curr[idx].isNumber {
            var temp = curr
            if temp[idx].isLowercase {
                temp[idx] = Character(temp[idx].uppercased())
            } else {
                temp[idx] = Character(temp[idx].lowercased())
            }
            bt(idx+1, temp)
        }
    }
    bt(0, arr)
    return result
}
