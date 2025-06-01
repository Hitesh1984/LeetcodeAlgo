//
//  keyAndRooms-841.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/13/25.
//

import Foundation

@inline(__always)
func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
    var counter = 0
    var visited = Array(repeating: false, count: rooms.count)
    @inline(__always)
    func dfs(_ room:Int) {
        if visited[room] {
            return
        }
        visited[room].toggle()
        counter += 1
        for rm in rooms[room] {
            dfs(rm)
        }
    }
    dfs(0)
    return counter == rooms.count
}
