//
//  LinkedList.swift
//  Calculator
//
//  Created by hyunMac on 10/12/23.
//

struct LinkedList<T> {
    private final class Node {
        private(set) var next: Node?
        private(set) var element: T
        
        init(_ element: T) {
            self.next = nil
            self.element = element
        }
        
        func setNext(_ node: Node) {
            self.next = node
        }
    }
    
    private var head: Node?
    private var tail: Node?
    private var nodeCount = 0
    
    mutating func append(_ elemnet: T) {
        let newNode = Node(elemnet)
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.setNext(newNode)
            tail = newNode
        }
        nodeCount += 1
    }
    
    mutating func removeFirst() -> T? {
        guard let element = head?.element else {
            return nil
        }
        head = head?.next
        nodeCount -= 1
        return element
    }
    
    func peek() -> T? {
        guard let peekElement = head?.element else {
            return nil
        }
        return peekElement
    }
    
    func isEmpty() -> Bool {
        return head == nil ? true : false
    }
    
    mutating func clear() {
        head = nil
        tail = nil
        nodeCount = 0
    }
    
    func count() -> Int {
        return nodeCount
    }
}
