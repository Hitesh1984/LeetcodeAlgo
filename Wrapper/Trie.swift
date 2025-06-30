//
//  Trie.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 2/17/25.
//

import Foundation

/*
class TrieNode<T:Hashable>  {
    var value:T?
    weak var parent:TrieNode?
    var children:[T:TrieNode] = [:]
    init(value:T?=nil, parent:TrieNode?=nil) {
        self.value = value
        self.parent = parent
    }
    func add(child:T) {
        guard children[child] == nil else {
            return
        }
        children[child] = TrieNode(value: child, parent: self)
    }
    func childrenContain(character:T) -> Bool
    {
        if let _ = children[character] { return true } else { return false }
    }
}
class Trie {
    typealias Node = TrieNode<Character>
    let root:Node
    init() {
        root = Node()
    }
}
extension Trie {
    func insert(word:String) {
        guard !word.isEmpty else { return }
        var currentNode = root
        for (index,character) in word.lowercased().enumerated() {
            if let child = currentNode.children[character] {
                currentNode = child
            } else {
                currentNode.add(child: character)
                currentNode = currentNode.children[character]!
            }
        }
    }
}
 */
// 678 341 5166 Ext 106
