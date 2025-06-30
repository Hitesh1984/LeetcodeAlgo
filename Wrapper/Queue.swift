//
//  Queue.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 2/5/25.
//

import Foundation

public protocol Queue {
  associatedtype Element
  mutating func enqueue(_ element: Element) -> Bool
  mutating func dequeue() -> Element?
  var isEmpty: Bool { get }
  var peek: Element? { get }
}

public struct QueueArray<T:Comparable>: Queue {
  private var array: [T] = []
  public init() {}
    

    public var isEmpty: Bool {
      array.isEmpty // 1
    }
    
    public var count:Int? {
        if !isEmpty {
            return array.count
        }
        return array.count
    }

    public var peek: T? {
      array.first // 2
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
      array.append(element)
      return true
    }
    
    public mutating func dequeue() -> T? {
      isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
  public var description: String {
    String(describing: array)
  }
}

