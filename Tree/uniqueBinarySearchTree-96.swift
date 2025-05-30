//
//  uniqueBinarySearchTree96.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/22/25.
//

import Foundation
/*
 https://leetcode.com/problems/unique-binary-search-trees/description/
 
 Given an integer n, return the number of structurally unique BST's (binary search trees) which has exactly n nodes of unique values from 1 to n.

  

 Example 1:


 Input: n = 3
 Output: 5
 Example 2:

 Input: n = 1
 Output: 1
  

 Constraints:

 1 <= n <= 19
 */

func numTrees(_ n: Int) -> Int {
    guard n > 1 else { return 1 }
    var map: [Int] = [1, 1]
    for i in 2...n {
        //print("\t i value = \(i)")
        var tmp = 0
        for j in 0..<i {
            //print("\t \t tmp value = \(tmp)")
            tmp += map[j] * map[i - j - 1]
            //print("\t \t \t tmp value = \(tmp)")
        }
        map.append(tmp)
    }
    return map[n]
}

