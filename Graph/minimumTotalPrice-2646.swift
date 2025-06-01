//
//  minimumTotalPrice.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/17/25.
//

import Foundation


class GraphMinimumPrice {
    func minimumTotalPrice(_ n: Int, _ edges: [[Int]], _ price: [Int], _ trips: [[Int]]) -> Int {
        var visited: Set<Int> = []
        var graph: [Int: [Int]] = [:]
        var count: [Int: Int] = [:]

        for edge in edges {
            graph[edge[0], default: []].append(edge[1])
            graph[edge[1], default: []].append(edge[0])
        }
        for trip in trips {
            visited = []
            let possible = dfs(start: trip[0], end: trip[1], visited: &visited, graph: graph)
            for c in possible {
                count[c, default: 0] += 1
            }
        }
        visited = []
        let res = dfs(0, &visited, graph, price, count)
        return min(res.0, res.1)
    }

    private func dfs(start: Int, end: Int, visited: inout Set<Int>, graph: [Int: [Int]]) -> [Int] {

        guard start != end else { return [start] }

        visited.insert(start)
        for n in graph[start, default: []] where !visited.contains(n) {
            if n == end {
                return [start, end]
            } else {
                let res = dfs(start: n, end: end, visited: &visited, graph: graph)
                if res != [] {
                    return [start] + res
                }
            }
        }

        return []
    }

    private func dfs(_ i: Int, _ visited: inout Set<Int>, _ graph: [Int: [Int]], _ price: [Int], _ count: [Int: Int]) -> (Int, Int) {
        visited.insert(i)
        guard let notVisitedNeighbours = graph[i]?.filter({
            !visited.contains($0) })
        else {
            return (count[i, default: 0] * (price[i] / 2), count[i, default: 0] * price[i])
        }
        let notVisitedPrices = notVisitedNeighbours.map { (Int) -> (Int, Int) in
            let pair = dfs(Int, &visited, graph, price, count)
            return pair
        }
        let halve = count[i, default: 0] * (price[i] / 2) + notVisitedPrices.map(\.1).reduce(0, +)
        let notHalve = count[i, default: 0] * price[i] + notVisitedPrices.map { min($0.0, $0.1) }.reduce(0, +)
        return (halve, notHalve)
    }
}

/*
class GraphMinimumPrice {

    // n = 4
    // edges =     [[0,1],[1,2],[1,3]]
    // price = [2,2,10,6]
    // trips = [[0,3],[2,1],[2,3]]
   
    func minimumTotalPrice(_ n: Int, _ edges: [[Int]], _ price: [Int], _ trips: [[Int]]) -> Int {
        var visited: Set<Int> = []
        var graph: [Int: [Int]] = [:]
        var count: [Int: Int] = [:]

        for edge in edges {
            graph[edge[0], default: []].append(edge[1])
            graph[edge[1], default: []].append(edge[0])
        }
        //print(graph)
        
        for trip in trips {
            visited = []
//            for c in dfs(start: trip[0], end: trip[1], visited: &visited, graph: graph) {
//                count[c, default: 0] += 1
//            }
            
            let possible = dfs(start: trip[0], end: trip[1], visited: &visited, graph: graph)
//            print(trip)
//            print(possible)
            for c in possible {
                count[c, default: 0] += 1
            }
        }
        visited = []
        let res = dfs(0, &visited, graph, price, count)
        return min(res.0, res.1)
    }

    private func dfs(start: Int, end: Int, visited: inout Set<Int>, graph: [Int: [Int]]) -> [Int] {

        guard start != end else { return [start] }

        visited.insert(start)
        for n in graph[start, default: []] where !visited.contains(n) {
            if n == end {
                return [start, end]
            } else {
                let res = dfs(start: n, end: end, visited: &visited, graph: graph)
                if res != [] {
                    return [start] + res
                }
            }
        }

        return []
    }

    private func dfs(_ i: Int, _ visited: inout Set<Int>, _ graph: [Int: [Int]], _ price: [Int], _ count: [Int: Int]) -> (Int, Int) {
        visited.insert(i)
        //print("visited = \(visited) for i = \(i)")
        guard let notVisitedNeighbours = graph[i]?.filter({
            !visited.contains($0) })
        else {
            return (count[i, default: 0] * (price[i] / 2), count[i, default: 0] * price[i])
        }
        //print("notVisitedNeighbours = \(notVisitedNeighbours)")
        
        let notVisitedPrices = notVisitedNeighbours.map { (Int) -> (Int, Int) in
            let pair = dfs(Int, &visited, graph, price, count)
            print("i = \(i) notVisited = %d \(Int) pair = \(pair)")
            //let res1 = pair.map(\.1).reduce(0, +)
            //let res2 =
            return pair
        }
        
        
//        let notVisitedPrices = notVisitedNeighbours.map {
//            dfs($0, &visited, graph, price, count)
//        }
        print("Dave i= \(i) and \(notVisitedPrices)")
        let res1 = notVisitedPrices.map(\.1).reduce(0, +)
        //print(res1)
        let res2 = notVisitedPrices.map { min($0.0, $0.1) }.reduce(0, +)
        print("Dave ends \(res1) and \(res2)")
        let halve = count[i, default: 0] * (price[i] / 2) + notVisitedPrices.map(\.1).reduce(0, +)
        let notHalve = count[i, default: 0] * price[i] + notVisitedPrices.map { min($0.0, $0.1) }.reduce(0, +)
        print("i = \(i) Dave halves \(halve) and \(notHalve)")
//        print("graph \(graph) and price = \(price)")
//        print("i = \(i) , nei = \(notVisitedNeighbours) price = \(notVisitedPrices) count = \(count) " )
//        print("halve = \(halve) and notHalve = \(notHalve)")
        return (halve, notHalve)
    }
}
*/
