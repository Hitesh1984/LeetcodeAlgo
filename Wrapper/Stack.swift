//
//  Stack.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 3/15/25.
//

import Foundation

public struct Stack<Element> {
    
    var storage:[Element] = []
    
    public init() {}
}

extension Stack: CustomDebugStringConvertible {
    public var debugDescription: String {
        """
     ----top____
     \(storage.map { "\($0)"}.reversed().joined(separator: "\n"))
     """
    }
    
    public mutating func push(_ element:Element) {
        storage.append(element)
    }
    
    public mutating func push(_ element:[Element]) {
        storage += element
    }
    
    @discardableResult public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public func peek() -> Element? {
        storage.last
    }
    
    public var isEmpty: Bool {
        peek() == nil 
    }
}
