//
//  noOfConnectedCompnents-323.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/14/25.
//
/*
 https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 You have a graph of n nodes. You are given an integer n and an array edges where edges[i] = [ai, bi] indicates that there is an edge between ai and bi in the graph.
 
 Return the number of connected components in the graph.
 
 
 
 Example 1:
 
 
 Input: n = 5, edges = [[0,1],[1,2],[3,4]]
 Output: 2
 Example 2:
 
 
 Input: n = 5, edges = [[0,1],[1,2],[2,3],[3,4]]
 Output: 1
 
 
 Constraints:
 
 1 <= n <= 2000
 1 <= edges.length <= 5000
 edges[i].length == 2
 0 <= ai <= bi < n
 ai != bi
 There are no repeated edges.
 */

import Foundation

func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
    if edges.isEmpty { return n }
    if edges.count == 1 { return n-1 }
    var graph = Array(repeating: [Int](), count: n)
    for ed in edges {
        graph[ed[0]].append(ed[1])
        graph[ed[1]].append(ed[0])
    }
    var result = 0
    var stack = [Int]()
    var seen = Array(repeating: false, count: n)
    for i in 0..<n {
        if seen[i] {
            continue
        }
        result += 1
        stack.append(i)
        while let node = stack.popLast() {
            seen[node] = true
            for obj in graph[node] where !seen[obj] {
                stack.append(obj)
            }
        }
    }
    return result
}

/*
 func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
 if edges.isEmpty { return n }
 if edges.count == 1 { return n-1 }
 var graph = Array(repeating: [Int](), count: n)
 for ed in edges {
 graph[ed[0]].append(ed[1])
 graph[ed[1]].append(ed[0])
 }
 var result = 0
 var stack = [Int]()
 var seen = Array(repeating: false, count: n)
 for i in 0..<n {
 if seen[i] {
 continue
 }
 result += 1
 stack.append(i)
 while let node = stack.popLast() {
 if seen[node] {
 continue
 }
 seen[node] = true
 stack.append(contentsOf: graph[node])
 }
 }
 return result
 }
 */
