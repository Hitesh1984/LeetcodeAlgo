//
//  shortestPathWithAlternatingColors-1129.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/10/25.
//
/*
 https://leetcode.com/problems/shortest-path-with-alternating-colors/description/
 
 You are given an integer n, the number of nodes in a directed graph where the nodes are labeled from 0 to n - 1. Each edge is red or blue in this graph, and there could be self-edges and parallel edges.
 
 You are given two arrays redEdges and blueEdges where:
 
 redEdges[i] = [ai, bi] indicates that there is a directed red edge from node ai to node bi in the graph, and
 blueEdges[j] = [uj, vj] indicates that there is a directed blue edge from node uj to node vj in the graph.
 Return an array answer of length n, where each answer[x] is the length of the shortest path from node 0 to node x such that the edge colors alternate along the path, or -1 if such a path does not exist.
 
 
 
 Example 1:
 
 Input: n = 3, redEdges = [[0,1],[1,2]], blueEdges = []
 Output: [0,1,-1]
 Example 2:
 
 Input: n = 3, redEdges = [[0,1]], blueEdges = [[2,1]]
 Output: [0,1,-1]
 
 
 Constraints:
 
 1 <= n <= 100
 0 <= redEdges.length, blueEdges.length <= 400
 redEdges[i].length == blueEdges[j].length == 2
 0 <= ai, bi, uj, vj < n
 */

import Foundation


class shortestPath {
    enum EdgeColor { case red, blue, none }
    struct Node: Hashable {
        let node: Int
        let color: EdgeColor
    }
    struct WeightedNode {
        let pointNode: Node
        let length:Int
    }
    
    func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
        var redAdj = [Int: [Node]]()
        var blueAdj = [Int: [Node]]()
        for edge in redEdges {
            let (u, v) = (edge[0], edge[1])
            redAdj[u, default: [Node]()].append(Node(node: v, color: .red))
        }
        for edge in blueEdges {
            let (u, v) = (edge[0], edge[1])
            blueAdj[u, default: [Node]()].append(Node(node: v, color: .blue))
        }
        func checkNeighbourAndAdd(_ nodeVal:Int, _ dict:[Int: [Node]], _ length: Int ) {
            for nei in dict[nodeVal, default: []] {
                if !visited.contains(nei) {
                    visited.insert(nei)
                    queue.append(WeightedNode(pointNode: nei, length: length+1))
                }
            }
        }
        var answer = Array(repeating: -1, count: n)
        var queue = [WeightedNode(pointNode: Node(node: 0, color: .none), length: 0)]
        var visited = Set<Node>()
        visited.insert(Node(node: 0, color: .none))
        while !queue.isEmpty {
            let node = queue.removeFirst()
            let nodeVal = node.pointNode.node
            let color = node.pointNode.color
            let length = node.length
            if answer[nodeVal] == -1 {
                answer[nodeVal] = node.length
            }
            if color != .red {
                checkNeighbourAndAdd(nodeVal, redAdj, length)
            }
            if color != .blue {
                checkNeighbourAndAdd(nodeVal, blueAdj, length)
            }
        }
        return answer
    }
}

