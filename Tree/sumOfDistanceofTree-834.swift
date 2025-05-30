//
//  sumOfDistanceofTree.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/13/25.
//

import Foundation

/*
 
 https://leetcode.com/problems/sum-of-distances-in-tree/description/
 
 There is an undirected connected tree with n nodes labeled from 0 to n - 1 and n - 1 edges.

 You are given the integer n and the array edges where edges[i] = [ai, bi] indicates that there is an edge between nodes ai and bi in the tree.

 Return an array answer of length n where answer[i] is the sum of the distances between the ith node in the tree and all other nodes.

  

 Example 1:


 Input: n = 6, edges = [[0,1],[0,2],[2,3],[2,4],[2,5]]
 Output: [8,12,6,10,10,10]
 Explanation: The tree is shown above.
 We can see that dist(0,1) + dist(0,2) + dist(0,3) + dist(0,4) + dist(0,5)
 equals 1 + 1 + 2 + 2 + 2 = 8.
 Hence, answer[0] = 8, and so on.
 Example 2:


 Input: n = 1, edges = []
 Output: [0]
 Example 3:


 Input: n = 2, edges = [[1,0]]
 Output: [1,1]
  

 Constraints:

 1 <= n <= 3 * 104
 edges.length == n - 1
 edges[i].length == 2
 0 <= ai, bi < n
 ai != bi
 The given input represents a valid tree.
 
 */

func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
       // formula = parentSum - closerNodes + furtherNodes
       let graph = edges.reduce(into: Array(repeating: [Int](), count: n)) { graph, edge in
           graph[edge[0]].append(edge[1])
           graph[edge[1]].append(edge[0])
       }
       var closerNodesCount = Array(repeating: 0, count: n)
       var answer = Array(repeating: 0, count: n)
       var seen = Set<Int>()

       func dfs(_ cur: Int) -> Int {
           var closerNodes = 1

           for child in graph[cur] {
               if !seen.contains(child) {
                   seen.insert(child)
                   let childNodesCount = dfs(child)
                   closerNodes += childNodesCount
                   answer[0] += childNodesCount
               }
           }
           closerNodesCount[cur] = closerNodes
           return closerNodes
       }

       seen.insert(0)
       dfs(0) // populate closerNodesCount and answer[0]

       func dfs2(_ cur: Int) {
           for child in graph[cur] {
               if !seen.contains(child) {
                   seen.insert(child)
                   answer[child] = answer[cur] - closerNodesCount[child] + (n - closerNodesCount[child])
                   dfs2(child)
               }
           }
       }

       seen = Set<Int>()
       seen.insert(0)
       dfs2(0) // using answer[0] as base to populate all the other nodes

       return answer
   }
