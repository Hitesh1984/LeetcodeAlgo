//
//  histogram-84.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/9/25.
//
/*
 https://leetcode.com/problems/largest-rectangle-in-histogram/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an array of integers heights representing the histogram's bar height where the width of each bar is 1, return the area of the largest rectangle in the histogram.

  

 Example 1:


 Input: heights = [2,1,5,6,2,3]
 Output: 10
 Explanation: The above is a histogram where width of each bar is 1.
 The largest rectangle is shown in the red area, which has an area = 10 units.
 Example 2:


 Input: heights = [2,4]
 Output: 4
  

 Constraints:

 1 <= heights.length <= 105
 0 <= heights[i] <= 104
 */
import Foundation


func largestRectangleArea(_ heights: [Int]) -> Int {
    var stack = [(i: Int, h: Int)]()
    var res = 0
    
    for (i, h) in heights.enumerated() {
        var start = i
        print("i - \(i) , start - \(start) , h  - \(h)")
        while !stack.isEmpty, stack.last!.h > h {
            start = stack.last!.i
            res = max(res, (i - start) * stack.last!.h)
            stack.removeLast()
            print("inside while loop, i - \(i) , start - \(start) , h  - \(h), stack - \(stack), res - \(res)")
        }
        
        stack.append((start, h))
        print("After appending stack - \(stack)")
    }
    
    print("after for loop stack - \(stack) and res - \(res)")
    for b in stack {
        res = max(res, (heights.count - b.i) * b.h)
        print("inside stack for loop, res - \(res), current Stack - \(b), and height = \(heights.count)")
    }
    
    return res
}
