//
//  maxStack-716.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/8/25.
//

import Foundation
import Collections

class MaxStack {
    struct Node: Comparable {
        let val: Int
        let idx: Int
        static func < (lhs: Node, rhs: Node) -> Bool {
            if lhs.val == rhs.val {
                return lhs.idx < rhs.idx
            }
            return lhs.val < rhs.val
        }
    }
    var stack: [Node] = []
    var removed: Set<Int> = Set()
    var heap:Heap<Node> = []
    var cnt: Int = 0

    func push(_ x: Int) {
        let n = Node(val:x, idx:cnt)
        cnt += 1
        heap.insert(n)
        stack.append(n)
    }
    func pop() -> Int {
        let n = stack.removeLast()
        var buffer = [Node]()
        while !heap.isEmpty {
            let last = heap.popMax()!
            if last == n {
                break
            }
            buffer.append(last)
        }
        while !buffer.isEmpty {
            heap.insert(buffer.removeLast())
        }
        return n.val
    }
    func top() -> Int {
        let n = stack.last!
        return n.val
    }
    func peekMax() -> Int {
        let n = heap.max!
        return n.val
    }
    func popMax() -> Int {
        let n = heap.removeMax()
        let index = stack.firstIndex(of: n) ?? 0
        stack.remove(at: index)
        return n.val
    }
}
