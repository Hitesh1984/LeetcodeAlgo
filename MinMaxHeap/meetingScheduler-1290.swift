//
//  meetingScheduler-1290.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/21/25.
/*
 https://leetcode.com/problems/meeting-scheduler/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given the availability time slots arrays slots1 and slots2 of two people and a meeting duration duration, return the earliest time slot that works for both of them and is of duration duration.

 If there is no common time slot that satisfies the requirements, return an empty array.

 The format of a time slot is an array of two elements [start, end] representing an inclusive time range from start to end.

 It is guaranteed that no two availability slots of the same person intersect with each other. That is, for any two time slots [start1, end1] and [start2, end2] of the same person, either start1 > end2 or start2 > end1.

  

 Example 1:

 Input: slots1 = [[10,50],[60,120],[140,210]], slots2 = [[0,15],[60,70]], duration = 8
 Output: [60,68]
 Example 2:

 Input: slots1 = [[10,50],[60,120],[140,210]], slots2 = [[0,15],[60,70]], duration = 12
 Output: []
  

 Constraints:

 1 <= slots1.length, slots2.length <= 104
 slots1[i].length, slots2[i].length == 2
 slots1[i][0] < slots1[i][1]
 slots2[i][0] < slots2[i][1]
 0 <= slots1[i][j], slots2[i][j] <= 109
 1 <= duration <= 106

 */

import HeapModule
struct timeSlot:Comparable {
    let start:Int
    let end:Int
    static func < (_ lhs:timeSlot, _ rhs:timeSlot) -> Bool {
        return lhs.start < rhs.start
    }
}

class Solution123444 {
    func minAvailableDuration(_ slots1: [[Int]], _ slots2: [[Int]], _ duration: Int) -> [Int] {
        var heap = Heap<timeSlot>()
        for arr in slots1 {
            if(arr[1] - arr[0] >= duration) {
                heap.insert(timeSlot(start:arr[0], end:arr[1]))
            }
        }
        for arr in slots2 {
            if(arr[1] - arr[0] >= duration) {
                heap.insert(timeSlot(start:arr[0], end:arr[1]))
            }
        }
        
        while heap.unordered.count > 1 {
            let pair1 = heap.removeMin()
            if  pair2.start + duration <= pair1.end{
                return [pair2.start, pair2.start + duration]
            }
        }
        return []
    }
}
