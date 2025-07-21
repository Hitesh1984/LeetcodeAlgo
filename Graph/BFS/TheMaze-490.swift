//
//  TheMaze-490.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/9/25.
/*
 https://leetcode.com/problems/the-maze/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 There is a ball in a maze with empty spaces (represented as 0) and walls (represented as 1). The ball can go through the empty spaces by rolling up, down, left or right, but it won't stop rolling until hitting a wall. When the ball stops, it could choose the next direction.

 Given the m x n maze, the ball's start position and the destination, where start = [startrow, startcol] and destination = [destinationrow, destinationcol], return true if the ball can stop at the destination, otherwise return false.

 You may assume that the borders of the maze are all walls (see examples).

  

 Example 1:


 Input: maze = [[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], start = [0,4], destination = [4,4]
 Output: true
 Explanation: One possible way is : left -> down -> left -> down -> right -> down -> right.
 Example 2:


 Input: maze = [[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], start = [0,4], destination = [3,2]
 Output: false
 Explanation: There is no way for the ball to stop at the destination. Notice that you can pass through the destination but you cannot stop there.
 Example 3:

 Input: maze = [[0,0,0,0,0],[1,1,0,0,1],[0,0,0,0,0],[0,1,0,0,1],[0,1,0,0,0]], start = [4,3], destination = [0,1]
 Output: false
  

 Constraints:

 m == maze.length
 n == maze[i].length
 1 <= m, n <= 100
 maze[i][j] is 0 or 1.
 start.length == 2
 destination.length == 2
 0 <= startrow, destinationrow < m
 0 <= startcol, destinationcol < n
 Both the ball and the destination exist in an empty space, and they will not be in the same position initially.
 The maze contains at least 2 empty spaces.
 */

func hasPath(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Bool {
    var seen: Set<Int> = []
    var queue = [start]
    while !queue.isEmpty {
        let position = queue.removeLast()
        let i = position[0]
        let j = position[1]
        if !seen.insert(i * maze[i].count + j).inserted { continue }
        if position == destination { return true }
        
        for d in [[0, -1], [0, 1], [1, 0], [-1, 0]] {
            var newI = i
            var newJ = j
            while (0..<maze.count).contains(newI + d[0])
                    && (0..<maze[i].count).contains(newJ + d[1])
                    && maze[newI + d[0]][newJ + d[1]] != 1 {
                newI += d[0]
                newJ += d[1]
            }
            if newI != i || newJ != j {
                queue.append([newI, newJ])
            }
        }
    }
    return false
}
