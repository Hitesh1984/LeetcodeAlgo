
//
//  TestAlgorithm
//
//  Created by Dave, Hiteshkumar on 8/10/22.
//  Copyright © 2022 Dave, Hiteshkumar. All rights reserved.
//

import Foundation

struct MaxHeap {
    var items: [Int] = []
    var counter = 0
    var size:Int = 5
    
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    // Boolean Check
    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < items.count
    }
    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < items.count
    }
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }
    
    // Return Item From Heap
    private func leftChild(_ index: Int) -> Int {
        return items[getLeftChildIndex(index)]
    }
    private func rightChild(_ index: Int) -> Int {
        return items[getRightChildIndex(index)]
    }
    private func parent(_ index: Int) -> Int {
        return items[getParentIndex(index)]
    }
    
    public func peek() -> Int {
        if items.count != 0 {
            return items[0]
        } else {
            fatalError()
        }
    }
    public func median() -> Int {
        if items.count != 0 {
            let count = items.count
            let medium = (count + 1)/2
            if count % 2 == 0 {
                return (items[medium-1] + items[medium])/2
            } else { return items[medium-1] }
        } else {
            fatalError()
        }
    }
    mutating public func poll() -> Int {
        if items.count != 0 {
            let item = items[0]
            items[0] = items[items.count - 1]
            heapifyDown()
            items.removeLast()
            return item
        } else {
            fatalError()
        }
    }
    mutating public func add(_ item: Int) {
        items.append(item)
        heapifyUp()
        //heapifyDown()
    }
    mutating private func swap(indexOne: Int, indexTwo: Int) {
        let placeholder = items[indexOne]
        items[indexOne] = items[indexTwo]
        items[indexTwo] = placeholder
    }
    mutating private func heapifyUp() {
        var index = items.count - 1
        var parentIndex = getParentIndex(index)
        while( (parentIndex >= 0 ) && (items[parentIndex] < items[index] ))
        {
            items.swapAt(parentIndex, index)
            index = parentIndex
            parentIndex = getParentIndex(index)
            counter = counter + 1
        }
    }
    mutating private func heapifyDown() {
        var index = 0
        let length = self.items.count
        var leftChildIndex = getLeftChildIndex(index)
        while (leftChildIndex < length)
        {
            let rightChildIndex = getRightChildIndex(index)
            var biggerChildIndex = leftChildIndex
            if( rightChildIndex < length && items[rightChildIndex] > items[leftChildIndex] )
            {
                biggerChildIndex = rightChildIndex
            }
            if items[index] > items[biggerChildIndex] {
                break
            } else {
                //swap(indexOne: index, indexTwo: smallerChildIndex)
                items.swapAt(index, biggerChildIndex)
                counter = counter + 1
            }
            index = biggerChildIndex
            leftChildIndex = getLeftChildIndex(index)
        }
    }
    mutating func findAndRemove(value:Int, withHeapify:Bool = false)
    {
        if isEmpty() { return }
        if let index = items.firstIndex(of: value) {
            items.remove(at: index)
            heapifyDown()
        }
    }
    func isEmpty() -> Bool {
        if items.count == 0 {
            return true
        }
        return false
    }
    // I think this function for minPriority
    /*
    mutating public func checkSizeAndAdd(_ item: Int) {
        if( size > 0 && items.count >= size)
        {
            if(items[0] > item)
            {
                items[0] = item
                heapifyDown()
            }
        } else
        {
            items.append(item)
            heapifyUp()
        }
    }
     */
}
