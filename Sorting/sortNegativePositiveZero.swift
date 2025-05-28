//
//  sortNegativePositiveZero.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/1/25.
//

import Foundation

/*Given An unsorted array only containing integers. Sort Array in a way that all negative will be at left and all
 zero will be at right and all positive will be in middel.
 
 example input [1,0,  -2, -3, 7, 0, -1, 9]
 output [-2, -3, -1, 1,9, 0, 0 ]
 */


func sortNegativePositiveAndZero(input: inout [Int])  {
    if input.count > 1 {
      var negativeIndex = 0
      var zeroIndex = input.count-1
      var iteration = 0
      while (iteration <= zeroIndex) {
        if input[iteration] == 0 {
           input.swapAt(iteration, zeroIndex)
           zeroIndex = zeroIndex - 1
            if input[iteration] < 0 {
                input.swapAt(iteration, negativeIndex)
                negativeIndex = negativeIndex + 1
            }
        } else if input[iteration] < 0 {
          input.swapAt(iteration, negativeIndex)
          negativeIndex = negativeIndex + 1
        }
        iteration = iteration + 1
      }
    }
}

/*
var input = [2,0,  4,0 ,-5, 0,9, -7,  -8, 10]
sortNegativePositiveAndZero(input:&input)
print(input)
*/
