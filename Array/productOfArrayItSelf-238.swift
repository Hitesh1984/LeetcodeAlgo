//
//  productOfArrayItSelf-238.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/19/25.
/*
 https://leetcode.com/problems/product-of-array-except-self/
 
 */

import Foundation

func productExceptSelf(_ nums: [Int]) -> [Int] {
    let count = nums.count
    var result: [Int] = Array(repeating: 1, count: count)
    var left = 1, right = 1
    for index in 0..<nums.count {
        result[index] *= left
        left *= nums[index]
        let rightIndex = count - 1 - index
        result[rightIndex] *= right
        right *= nums[rightIndex]
    }
    if left == right {
        return result
    } else {
        return []
    }
}
