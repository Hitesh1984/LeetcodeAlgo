//
//  Matrix.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 12/24/23.
//

import Foundation

struct Matrix<T> {
    let rows: Int, columns: Int
    var grid: [T]
    
    init(rows: Int, columns: Int,defaultValue: T) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: defaultValue, count: rows * columns) as! [T]
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        //return row >= 0 && row < rows && column >= 0 && column < columns
        return 0...rows ~= row && 0...columns ~= column
    }
    subscript(row: Int, column: Int) -> T {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
    
    
    
    func printMatrix()
    {
        guard rows > 0, columns > 0 else
        {
            print("Matrix is empty")
            return
        }
        print("\n\n")
        for row in 0..<rows
        {
            var str = "\t"
            for column in 0..<columns
            {
                str = str + "\t" + "\(self[row,column])"
            }
            print(str)
            print("\n")
        }
    }
}
