//
//  NonOverlappingIntervals-435.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 10/30/25.
/*
 
 https://leetcode.com/problems/non-overlapping-intervals/description/?envType=problem-list-v2&envId=array
 
 Given an array of intervals intervals where intervals[i] = [starti, endi], return the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.

 Note that intervals which only touch at a point are non-overlapping. For example, [1, 2] and [2, 3] are non-overlapping.

  

 Example 1:

 Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
 Output: 1
 Explanation: [1,3] can be removed and the rest of the intervals are non-overlapping.
 Example 2:

 Input: intervals = [[1,2],[1,2],[1,2]]
 Output: 2
 Explanation: You need to remove two [1,2] to make the rest of the intervals non-overlapping.
 Example 3:

 Input: intervals = [[1,2],[2,3]]
 Output: 0
 Explanation: You don't need to remove any of the intervals since they're already non-overlapping.
  

 Constraints:

 1 <= intervals.length <= 105
 intervals[i].length == 2
 -5 * 104 <= starti < endi <= 5 * 104
 */

import Foundation

func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    var arr = intervals
    arr.sort(by: {$0[0] < $1[0]})
    var count = 0
    var lastRangeStart = arr[0][0]
    var lastRangeEnd = arr[0][1]
    
    for (i,cur) in arr.enumerated() where i > 0 {
        let curStart = cur[0]
        let curEnd = cur[1]
        if lastRangeEnd > curStart {
            if lastRangeEnd > curEnd {
                lastRangeStart = curStart
                lastRangeEnd = curEnd
            }
            count += 1
        } else {
            lastRangeStart = curStart
            lastRangeEnd = curEnd
        }
    }
    return count
}
