//
//  MinHeap.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 2/27/25.
//

import Foundation
struct MinHeap<T: Comparable>
{
    typealias PointValue = (value: T, point: [Int])
    var items: [PointValue] = []
    mutating func swap(_ first: Int,
              _ second: Int)
    {
        let auxiliary: PointValue = items[first];
        items[first] = items[second];
        items[second] = auxiliary;
    }
    mutating func compare(_ left: Int,
                 _ right: Int,
                 _ root: Int) -> Int
    {
        let size = items.count
        var location: Int = -1;
        if (left < size && items[left].value < items[root].value)
        {
            if (right < size && items[right].value < items[left].value)
            {
                self.items.swapAt(right, root);
                location = right;
            }
            else
            {
                self.swap(left, root);
                location = left;
            }
        }
        else if (right < size && items[right].value < items[root].value)
        {
            self.swap(right, root);
            location = right;
        }
        return location;
    }
    mutating func heap(_ root: Int)
    {
        let left: Int = 2 * root + 1;
        let right: Int = 2 * root + 2;
        let step: Int = self.compare(left,
                                     right,
                                     root);
        if (step  != -1)
        {
            // Need to convert into min heap
            self.heap(step);
        }
    }
    mutating func minHeapify() {
        var i = items.count
        while (i >= 0)
        {
            self.heap( i);
            i -= 1;
        }
    }
    mutating func pop() -> PointValue {
        if items.count != 0 {
            let item = items[0]
            items.removeFirst()
            minHeapify()
            return item
        } else {
            fatalError()
        }
    }
    func printData(_ arr: [Int], _ size: Int)
    {
        var i: Int = 0;
        while (i < size)
        {
            print(arr[i], terminator: "  ");
            i += 1;
        }
        print();
    }
}



