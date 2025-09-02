//
//  MinimumWindowSubstring-76.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/28/25.
//

import Foundation

/*
 https://leetcode.com/problems/minimum-window-substring/description/?envType=problem-list-v2&envId=sliding-window
 
 Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".

 The testcases will be generated such that the answer is unique.

  

 Example 1:

 Input: s = "ADOBECODEBANC", t = "ABC"
 Output: "BANC"
 Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
 Example 2:

 Input: s = "a", t = "a"
 Output: "a"
 Explanation: The entire string s is the minimum window.
 Example 3:

 Input: s = "a", t = "aa"
 Output: ""
 Explanation: Both 'a's from t must be included in the window.
 Since the largest window of s only has one 'a', return empty string.
  

 Constraints:

 m == s.length
 n == t.length
 1 <= m, n <= 105
 s and t consist of uppercase and lowercase English letters.
  

 Follow up: Could you find an algorithm that runs in O(m + n) time?
 
 */

class MinimumWindowSubString {
    //Input: s = "ADOBECODEBANC", t = "ABC"
    //Output: "BANC"
    func minWindow(_ s: String, _ t: String) -> String {
        guard s.count >= t.count else { return "" }
        
        let sChars = Array(s)
        let tChars = Array(t)
        
        let indexs = validIndexs(sChars, tChars) // res [0, 3, 5, 9, 11, 12]
        guard s.count >= t.count else { return "" }
        
        let target = targetChars(tChars) // ["A": 1, "B":1, "C": 1]
        let firstMatchIndex = firstMatch(sChars, indexs, target)
        var start = firstMatchIndex.0
        var end = firstMatchIndex.1
        
        if end == -1 {
            return ""
        }
        
        var tmp: [Character: Int] = [:]
        for i in indexs {
            if i < indexs[start] {
                continue
            }
            
            if i > indexs[end] {
                break
            }
            
            let c = sChars[i]
            if let _ = tmp[c] {
                tmp[c]! += 1
            
            } else {
                tmp[c] = 1
            }
        }
        
        var minLength = indexs[end] - indexs[start]
        var minStart = start
        
        while end < indexs.count {
            //  start +1
            let c = sChars[indexs[start]]
            
            if tmp[c]! > target[c]! {
                start += 1
                tmp[c]! -= 1
                let currentLength = indexs[end] - indexs[start]
                minLength = minLength < currentLength ? minLength : currentLength
                minStart = minLength < currentLength ? minStart : start
                continue
            
            } else {
                start += 1
                tmp[c]! -= 1
                end += 1
                while end < indexs.count {
                    let e = sChars[indexs[end]]
                    tmp[e]! += 1
                    if e == c {
                        let currentLength = indexs[end] - indexs[start]
                        minLength = minLength < currentLength ? minLength : currentLength
                        minStart = minLength < currentLength ? minStart : start
                        break
                    }
                    end += 1
                }
            }
        }
        
        return Array(sChars[indexs[minStart]...indexs[minStart] + minLength]).join("")
        
    }

    
    func firstMatch(_ s: [Character], _ indexs: [Int], _ target: [Character: Int]) -> (Int, Int) {
        
        // indexes res [0, 3, 5, 9, 11, 12]
        //target  ["A": 1, "B":1, "C": 1]
        
        var target = target
        var tmp = -1
        
        func reachTarget() -> Bool {
            var res = true
            for (_, value) in target {
                if value > 0 {
                    res = false
                    break
                }
            }
            return res
        }
        
        for (i, index) in indexs.enumerated() { // [0, 3, 5, 9, 11, 12]
            target[s[index]]! -= 1
            if reachTarget() {
                tmp = i
                break
            }
        }
        
        return (0, tmp)
    }
    

    func validIndexs(_ s: [Character], _ t: [Character]) -> [Int] {
        var res: [Int] = []
        //Input: s = "ADOBECODEBANC", t = "ABC"
        for (i, c) in s.enumerated() {
            if t.contains(c) { res.append(i) }
            // res [0, 3, 5, 9, 11, 12]
        }
        return res
    }

    
    func targetChars(_ t: [Character]) -> [Character: Int] {
        var map: [Character: Int] = [:]
        // t = "ABC"
        for c in t {
            if let _ = map[c] { map[c]! += 1 } else { map[c] = 1 }
        }
        
//        let map2: [Character: Int] = t.reduce(into: [:]) { counts, letter in
//            counts[letter, default: 0] += 1
//        }
        
        return map
    }

}


extension Array {
    func join(_ s: String) -> String {
        guard self.count > 0 else { return "" }
        if self.count == 1 { return "\(self[0])" }
        var string = ""

        for i in 0..<self.count - 1 { string += "\(self[i])\(s)" }
        
        string += "\(self[self.count - 1])"
        return string
    }
}

