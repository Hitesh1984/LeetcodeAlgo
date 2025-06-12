//
//  slidingWindowMaxInt.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 2/11/24.
//

import Foundation

/*
func findMaximumSlidingWindow(input:[Int], target: Int) -> [Int] {
    var output:[Int] = []
    var maxHeap = MaxHeap()
    
    for (curIndex, curVal) in input.enumerated() {
        let left = curIndex - target
        if left > 0 &&
            !maxHeap.isEmpty() &&
            maxHeap.peek() == input[left] {
            maxHeap.poll()
        }
        maxHeap.add(curVal)
        if curIndex >= (target - 1) {
            output.append(maxHeap.peek())
        }
    }
    print(maxHeap.items)
    return output
}
 */

// [1,3,1,2,0,5]
func findMaximumSlidingWindow(input:[Int], target: Int) -> [Int] {
    var output:[Int] = []
    var maxHeap = MaxHeap()
    for (curIndex, curVal) in input.enumerated() {
        let left = curIndex - target
        if left >= 0 &&
            !maxHeap.isEmpty() {
                maxHeap.findAndRemove(value: input[left])
        }
        maxHeap.add(curVal)
        if curIndex >= (target - 1) {
            output.append(maxHeap.peek())
        }
    }
    //print(maxHeap.items)
    return output
}

