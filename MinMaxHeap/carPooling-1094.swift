//
//  carPooling-1094.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/9/25.
/*
 https://leetcode.com/problems/car-pooling/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 There is a car with capacity empty seats. The vehicle only drives east (i.e., it cannot turn around and drive west).

 You are given the integer capacity and an array trips where trips[i] = [numPassengersi, fromi, toi] indicates that the ith trip has numPassengersi passengers and the locations to pick them up and drop them off are fromi and toi respectively. The locations are given as the number of kilometers due east from the car's initial location.

 Return true if it is possible to pick up and drop off all passengers for all the given trips, or false otherwise.

  

 Example 1:

 Input: trips = [[2,1,5],[3,3,7]], capacity = 4
 Output: false
 Example 2:

 Input: trips = [[2,1,5],[3,3,7]], capacity = 5
 Output: true
  

 Constraints:

 1 <= trips.length <= 1000
 trips[i].length == 3
 1 <= numPassengersi <= 100
 0 <= fromi < toi <= 1000
 1 <= capacity <= 105

 */
import Collections

struct trip:Comparable {
    let end:Int
    let passenger:Int
    
    static func < (lhs:trip, rhs:trip) -> Bool {
        lhs.end < rhs.end
    }
}

func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
    let trips = trips.sorted { $0[1] < $1[1] }
    var minHeap = Heap<trip>()
    var curPass = 0
    for tr in trips {
        let passenger = tr[0]
        let start = tr[1]
        let end = tr[2]
        while !minHeap.isEmpty, let prev = minHeap.min, start >= prev.end {
            curPass -= minHeap.removeMin().passenger
        }
        curPass += passenger
        minHeap.insert(trip(end: end, passenger: passenger))
        if curPass  > capacity { return false }
    }
    return true
}
