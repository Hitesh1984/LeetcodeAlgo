//
//  cheapestFlightsWithinKStops-787.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/12/25.
//
/*
 https://leetcode.com/problems/cheapest-flights-within-k-stops/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 There are n cities connected by some number of flights. You are given an array flights where flights[i] = [fromi, toi, pricei] indicates that there is a flight from city fromi to city toi with cost pricei.
 
 You are also given three integers src, dst, and k, return the cheapest price from src to dst with at most k stops. If there is no such route, return -1.
 
 
 
 Example 1:
 
 
 Input: n = 4, flights = [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], src = 0, dst = 3, k = 1
 Output: 700
 Explanation:
 The graph is shown above.
 The optimal path with at most 1 stop from city 0 to 3 is marked in red and has cost 100 + 600 = 700.
 Note that the path through cities [0,1,2,3] is cheaper but is invalid because it uses 2 stops.
 Example 2:
 
 
 Input: n = 3, flights = [[0,1,100],[1,2,100],[0,2,500]], src = 0, dst = 2, k = 1
 Output: 200
 Explanation:
 The graph is shown above.
 The optimal path with at most 1 stop from city 0 to 2 is marked in red and has cost 100 + 100 = 200.
 Example 3:
 
 
 Input: n = 3, flights = [[0,1,100],[1,2,100],[0,2,500]], src = 0, dst = 2, k = 0
 Output: 500
 Explanation:
 The graph is shown above.
 The optimal path with no stops from city 0 to 2 is marked in red and has cost 500.
 
 
 Constraints:
 
 1 <= n <= 100
 0 <= flights.length <= (n * (n - 1) / 2)
 flights[i].length == 3
 0 <= fromi, toi < n
 fromi != toi
 1 <= pricei <= 104
 There will not be any multiple flights between two cities.
 0 <= src, dst, k < n
 src != dst
 */

import Foundation

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int
{
    // build a directed weighted graph
    var adjList: [[(edge: Int, price: Int)]]  = Array(repeating: [], count: n)
    for flight in flights {
        adjList[flight.from].append((flight.to, flight.price))
    }
    
    // apply BFS starting from `src` till the distance k from it
    var minPrice = Int.max
    var stops = -1
    var visitedWithPrice = Array(repeating: Int.max, count: n)
    visitedWithPrice[src] = 0
    var queue = [(city: src, totalPrice: 0)]
    while stops <= k && !queue.isEmpty
    {
        var nextLevel: [(Int, Int)] = []
        for (city, totalPrice) in queue
        {
            if city == dst {
                minPrice = min(minPrice, totalPrice)
            }
            else
            {
                for (nextCity, price) in adjList[city]
                {
                    let nextCityPrice = totalPrice + price
                    // only consider the route if it is cheaper than previously found one
                    if nextCityPrice < visitedWithPrice[nextCity]
                    {
                        visitedWithPrice[nextCity] = nextCityPrice
                        nextLevel.append((nextCity, nextCityPrice))
                    }
                }
            }
        }
        queue = nextLevel
        stops += 1
    }
    return minPrice == Int.max ? -1 : minPrice
}


extension Array where Element == Int
{
    var from: Int { self[0] }
    var to: Int { self[1] }
    var price: Int { self[2] }
}
