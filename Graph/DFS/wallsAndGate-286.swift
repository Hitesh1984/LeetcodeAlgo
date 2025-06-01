//
//  wallsAndGate-286.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/4/25.
//

/*
 https://leetcode.com/problems/walls-and-gates/description/
 
 You are given an m x n grid rooms initialized with these three possible values.

 -1 A wall or an obstacle.
 0 A gate.
 INF Infinity means an empty room. We use the value 231 - 1 = 2147483647 to represent INF as you may assume that the distance to a gate is less than 2147483647.
 Fill each empty room with the distance to its nearest gate. If it is impossible to reach a gate, it should be filled with INF.

  

 Example 1:


 Input: rooms = [[2147483647,-1,0,2147483647],[2147483647,2147483647,2147483647,-1],[2147483647,-1,2147483647,-1],[0,-1,2147483647,2147483647]]
 Output: [[3,-1,0,1],[2,2,1,-1],[1,-1,2,-1],[0,-1,3,4]]
 Example 2:

 Input: rooms = [[-1]]
 Output: [[-1]]
  

 Constraints:

 m == rooms.length
 n == rooms[i].length
 1 <= m, n <= 250
 rooms[i][j] is -1, 0, or 231 - 1.
 
 
 */

import Foundation

class xyz {
    let gate = 0
    let wall = -1
    let emptyRoom = 2147483647
    
    func wallsAndGates(_ rooms: inout [[Int]]) {
        for i in 0..<rooms.count {
            for j in 0..<rooms[0].count where rooms[i][j] == gate {
                dfs(&rooms, i-1, j, gate+1)
                dfs(&rooms, i+1, j, gate+1)
                dfs(&rooms, i, j-1, gate+1)
                dfs(&rooms, i, j+1, gate+1)
            }
        }
    }
    
    func dfs(_ rooms: inout [[Int]], _ row:Int , _ col:Int, _ step:Int) {
        guard row >= 0 && row < rooms.count && col >= 0 && col < rooms[0].count else {
            return
        }
        if rooms[row][col] == wall {
            return
        }
        if rooms[row][col] == gate {
            return
        }
        guard step < rooms[row][col] else { return }
        
        rooms[row][col] = step
        dfs(&rooms, row, col+1, gate+1)
        dfs(&rooms, row, col-1, gate+1)
        dfs(&rooms, row-1, col, gate+1)
        dfs(&rooms, row+1, col, gate+1)
    }
}

class WallsAndGate {
    let gate = 0
    let wall = -1
    let emptyRoom = 2147483647
    
    func wallsAndGates(_ rooms: inout [[Int]]) {
        
        for i in 0..<rooms.count {
            for j in 0..<rooms[i].count where rooms[i][j] == gate {
                dfs(&rooms, i+1, j, gate+1)
                dfs(&rooms, i-1, j, gate+1)
                dfs(&rooms, i, j+1, gate+1)
                dfs(&rooms, i, j-1, gate+1)
            }
        }
    }
    
    func dfs(_ rooms: inout [[Int]], _ i: Int, _ j: Int, _ value: Int) {
        guard i >= 0, i < rooms.count, j >= 0, j < rooms[0].count else {
            return
        }
        guard ![wall, gate].contains(rooms[i][j]) else { // ROOM shhoumd not Wall or Gate
            return
        }
        guard value < rooms[i][j] else { // Room should be INF
            return
        }
        rooms[i][j] = value
        dfs(&rooms, i+1, j, value+1)
        dfs(&rooms, i-1, j, value+1)
        dfs(&rooms, i, j+1, value+1)
        dfs(&rooms, i, j-1, value+1)
    }
    
}
