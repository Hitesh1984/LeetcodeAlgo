//
//  missingRepeatingNumbers.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/29/25.
//
// https://leetcode.com/problems/find-missing-and-repeated-values/
/*
 You are given a read-only array of N integers with values also in the range [1, N] both inclusive. Each integer appears exactly once except A which appears twice and B which is missing. The task is to find the repeating and missing numbers A and B where A repeats twice and B is missing.
 
 Example 1:
 Input Format:  array[] = {3,1,2,5,3}
 Result: {3,4)
 Explanation: A = 3 , B = 4
 Since 3 is appearing twice and 4 is missing

 Example 2:
 Input Format: array[] = {3,1,2,5,4,6,7,5}
 Result: {5,8)
 Explanation: A = 5 , B = 8
 Since 5 is appearing twice and 8 is missing
 
 */

import Foundation

func getMissingAndRepeatingNums(_ nums:[Int]) -> [Int] {
    
    if nums.isEmpty {
        return []
    }
    
//    let hashMap2 : [Int:Int] = nums.reduce(into: [:]) {
//        $0[$1, default: 0] += 1
//    }
    
    let hashMap: [Int:Int] = nums.reduce(into: [:]) {
        $0[$1, default: 0] += 1 }
    var result = [Int]()
    
    for index in 1...nums.count {
        
        if let val = hashMap[index] {
            if val > 1 {
                result.append(index)
            }
        } else {
            result.append(index)
        }
    }
    return result
}
