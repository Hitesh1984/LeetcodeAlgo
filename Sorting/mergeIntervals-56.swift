//
//  mergeIntervals.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 3/4/25.
//

/*
 https://leetcode.com/problems/merge-intervals/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

  

 Example 1:

 Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
 Example 2:

 Input: intervals = [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
  

 Constraints:

 1 <= intervals.length <= 104
 intervals[i].length == 2
 0 <= starti <= endi <= 104
 */

import Foundation
func getMergeIntervals(input:[[Int]]) -> [[Int]]
{
    if input.count <= 1 {
        return input
    }
    let sortedInput = input.sorted(by:   {item1, item2 in
        return item1[0] < item2[0]
    })
    
    var result = [[Int]]()
    result.append(sortedInput[0])
    for i in 1..<sortedInput.count {
        let current = sortedInput[i]
        let last = result.last!
        if(current[0] <= last[1]) {
            result.removeLast()
            result.append([last[0], max(last[1], current[1])])
        } else {
            result.append(current)
        }
    }
    return result
}
