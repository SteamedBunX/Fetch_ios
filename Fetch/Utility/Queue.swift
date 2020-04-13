//
//  Queue.swift
//  Fetch
//
//  Created by yi.hao on 3/31/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import Intrepid

struct Queue<T>: Sequence {

    private var items = [T]()

    var isEmpty: Bool {
        return items.isEmpty
    }

    var count: Int {
        return items.count
    }

    mutating func enqueue(_ element: T) {
        items.append(element)
    }

    mutating func enqueueToFront(_ element: T) {
        items.insert(element, at: 0)
    }

    mutating func dequeue() -> T? {
        if items.isEmpty {
            return nil
        } else {
            return items.removeFirst()
        }
    }

    mutating func dequeueFromBack() -> T? {
        if items.isEmpty {
            return nil
        } else {
            return items.removeLast()
        }
    }

    func peek() -> T? {
        return items[ip_safely: 0]
    }

    func makeIterator() -> Array<T>.Iterator {
        return items.makeIterator()
    }
}
