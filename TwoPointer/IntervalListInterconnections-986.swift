//
//  IntervalListInterconnections-986.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/17/25./*

/*
 https://leetcode.com/problems/interval-list-intersections/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 You are given two lists of closed intervals, firstList and secondList, where firstList[i] = [starti, endi] and secondList[j] = [startj, endj]. Each list of intervals is pairwise disjoint and in sorted order.

 Return the intersection of these two interval lists.

 A closed interval [a, b] (with a <= b) denotes the set of real numbers x with a <= x <= b.

 The intersection of two closed intervals is a set of real numbers that are either empty or represented as a closed interval. For example, the intersection of [1, 3] and [2, 4] is [2, 3].

  

 Example 1:


 Input: firstList = [[0,2],[5,10],[13,23],[24,25]], secondList = [[1,5],[8,12],[15,24],[25,26]]
 Output: [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]
 Example 2:

 Input: firstList = [[1,3],[5,9]], secondList = []
 Output: []
  

 Constraints:

 0 <= firstList.length, secondList.length <= 1000
 firstList.length + secondList.length >= 1
 0 <= starti < endi <= 109
 endi < starti+1
 0 <= startj < endj <= 109
 endj < startj+1
 
 */

func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
    var result = [[Int]]()
    var i = 0
    var j = 0
    
    while i < firstList.count && j < secondList.count {
        let start1 = firstList[i][0]
        let end1 = firstList[i][1]
        let start2 = secondList[j][0]
        let end2 = secondList[j][1]
        
        // Check if intervals overlap
        let start = max(start1, start2)
        let end = min(end1, end2)
        
        if start <= end {
            result.append([start, end])
        }
        
        // Move to the next interval in the list with the earlier ending
        if end1 < end2 {
            i += 1
        } else {
            j += 1
        }
    }
    
    return result
}
