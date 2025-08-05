//
//  busRoutes-815.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/1/25.
/*
 https://leetcode.com/problems/bus-routes/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 You are given an array routes representing bus routes where routes[i] is a bus route that the ith bus repeats forever.

 For example, if routes[0] = [1, 5, 7], this means that the 0th bus travels in the sequence 1 -> 5 -> 7 -> 1 -> 5 -> 7 -> 1 -> ... forever.
 You will start at the bus stop source (You are not on any bus initially), and you want to go to the bus stop target. You can travel between bus stops by buses only.

 Return the least number of buses you must take to travel from source to target. Return -1 if it is not possible.

  

 Example 1:

 Input: routes = [[1,2,7],[3,6,7]], source = 1, target = 6
 Output: 2
 Explanation: The best strategy is take the first bus to the bus stop 7, then take the second bus to the bus stop 6.
 Example 2:

 Input: routes = [[7,12],[4,5,15],[6],[15,19],[9,12,13]], source = 15, target = 12
 Output: -1
  

  

 Constraints:

 1 <= routes.length <= 500.
 1 <= routes[i].length <= 105
 All the values of routes[i] are unique.
 sum(routes[i].length) <= 105
 0 <= routes[i][j] < 106
 0 <= source, target < 106

 */

func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
    if source == target { return 0 }
    var map = [Int: [Int]]()
    for i in 0..<routes.count {
        for route in routes[i] { // mapping all route to there buses
            map[route, default: []].append(i)
        }
    }
    // checking if there is bus for source and target itself if not then return -1
    // coz without bus it is impossible to reach target
    if map[source] == nil || map[target] == nil { return -1 }
    var count = 0
    var bfs = [source]
    var visit = [Int: Bool]()
    while !bfs.isEmpty { // bfs started
        for _ in bfs {
            let stop = bfs.removeFirst() // 1
            if stop == target { return count }
            for bus in map[stop, default: [] ] {
                if visit[bus, default: false] {
                    continue
                } else {
                    visit[bus] = true
                }
                for i in routes[bus] where i != stop {
                    bfs.append(i)
                }
            }
        }
        count += 1
    }
    return -1
}
