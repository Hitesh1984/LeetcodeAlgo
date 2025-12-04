//
//  distFromGate.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 2/5/25.
//

import Foundation

func wallsAndGate(roomsMatrix: inout Matrix<Int>) {
    
    let rows = roomsMatrix.rows
    let cols = roomsMatrix.columns
    var visit:Matrix<Bool> = Matrix(rows: rows, columns: cols, defaultValue: false)
    var queue:QueueArray<String> = QueueArray()
    
    func addRoom(row:Int ,col:Int)
    {
        if row < 0 || row == rows ||
            col < 0 || col == cols {
            return
        }
        if !visit.indexIsValid(row: row, column: col) || visit[row,col] == true {
            return
        }
        if roomsMatrix[row,col] == -1 || roomsMatrix[row,col] == 0 {
            return
        }
        visit[row,col] = true
        let rowColStr = String(format:"%d%d", row, col)
        queue.enqueue(rowColStr)
    }
    
    for row in stride(from: 0, through: (rows-1), by: 1) {
        for col in stride(from: 0, through: (cols-1), by: 1)
        {
            if roomsMatrix[row,col] == 0 {
                let rowColStr = String(format:"%d%d", row, col)
                queue.enqueue(rowColStr)
                visit[row,col] = true
            }
        }
    }
    var distance = 0
    while !queue.isEmpty {
        let queueCount = queue.count ?? -1
        for iteration in stride(from: 0, through: queueCount-1, by: 1) {
            guard let rowColStr = queue.dequeue(),
                  let row = Int(rowColStr[0]),
                  let col = Int(rowColStr[1])
            else { return }
            roomsMatrix[row,col] = distance
            addRoom(row: row+1, col: col)
            addRoom(row: row-1, col: col)
            addRoom(row: row, col: col+1)
            addRoom(row: row, col: col-1)
        }
        distance = distance + 1
    }
}

