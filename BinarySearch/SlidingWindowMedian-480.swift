//
//  SlidingWindowMedian.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/3/25.
//

import Foundation
import Collections

class Solution123 {
    struct Item: Comparable {
        let val, ind: Int
        init(_ val: Int, _ ind: Int) {
            self.val = val
            self.ind = ind
        }
        static func < (lhs: Item, rhs: Item) -> Bool {
            return lhs.val < rhs.val
        }
    }
    
    var small = Heap<Item>()
    var large = Heap<Item>()

    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        for (i, x) in nums[..<k].enumerated() {
            small.insert(Item(x, i))
        }
        for _ in 0..<(k-k/2) {
            large.insert(small.removeMin())
        }
        var ans = [ getMedian(k)  ]

        for (i, x) in nums[k...].enumerated() {
            if x > large.unordered[0].val {
                large.insert(Item(x, i+k))
                if nums[i] <= large.unordered[0].val, let largeItem = large.popMax() {
                    small.insert(largeItem)
                }
            } else {
                small.insert(Item(x, i+k))
                if nums[i] >= large.unordered[0].val, let smallItem = small.popMin() {
                    large.insert(smallItem)
                }
            }
            while !small.isEmpty && small.unordered[0].ind <= i {
                small.popMin()
            }
            while !large.isEmpty && large.unordered[0].ind <= i {
                large.popMax()
            }
            ans.append(getMedian(k))
        }
        return ans
    }

    func getMedian(_ k: Int) -> Double {
        (k % 2 != 0) ? Double(large.unordered[0].val) : Double(large.unordered[0].val + small.unordered[0].val) / 2
    }
}


/*
struct Heap<T: Comparable> {
     var heap = [T]()
    private let comparator: (T, T)->Bool
    
    init(_ comparator: @escaping (T, T)->Bool) {
        self.comparator = comparator
    }
    
    subscript(i: Int) -> T {heap[i]}
    var isEmpty: Bool {heap.isEmpty}
    var count: Int {heap.count}
    
    mutating func push(_ val: T) {
        heap.append(val)
        var pos = heap.count-1
        while pos > 0 && comparator(heap[pos], heap[(pos-1)/2]) {
            heap.swapAt(pos, (pos-1)/2)
            pos = (pos-1)/2
        }
    }
    
    mutating func pop() -> T? {
        guard let ans = heap.first else {return nil }
        heap[0] = heap.last!
        var pos = 0
        while pos*2 + 2 < heap.count {
            let swapSonInd =
                comparator(heap[pos*2 + 1], heap[pos*2 + 2]) ?
                (pos*2 + 1) : (pos*2 + 2)
            if comparator(heap[swapSonInd], heap[pos]) {
                heap.swapAt(pos, swapSonInd)
                pos = swapSonInd
            } else {
                break
            }
        }
        heap.popLast()
        return ans
    }
}
 */
/*
func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
       guard k > 1 else { return nums.map { Double($0) }}
       
       var answers: [Double] = []
       let nums: [Double] = nums.map { Double($0) }
       
       let isOdd = k % 2 != 0
       var toBeDeletedValue: Double = 0
       var newNums: [Double] = []
       for i in 0...(nums.count-k) {
           if i == 0 {
               newNums = Array(nums[i...(i + k - 1)]).sorted()
           } else {
               newNums.remove(at: newNums.firstIndex(of: toBeDeletedValue)!)
               newNums.insertSorted(element: nums[i + k - 1])
           }
           toBeDeletedValue = nums[i]
           if isOdd {
               answers.append(Double(newNums[k/2]))
           } else {
               let firstNumber = newNums[k/2]
               let secondNumber = newNums[k/2-1]
               answers.append((firstNumber + secondNumber) / 2.0)
           }
       }
       
       return answers
   }
}

extension Array where Element == Double {
   mutating func insertSorted(element: Element) {
       var low: Int = 0
       var high: Int = self.count - 1
       var mid: Int = (low + high) / 2
       while low <= high {
           mid = (high + low) / 2
           let midValue = self[mid]
           if element >= midValue {
               low = mid + 1
           } else {
               high = mid - 1
           }
       }
       self.insert(element, at: low)
   }
*/
