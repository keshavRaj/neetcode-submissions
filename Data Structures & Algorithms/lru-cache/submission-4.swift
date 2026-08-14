class LRUCache {

    class Node { 
        var value: Int
        var nextKey: Int?
        var prevKey: Int?

        init(_ value: Int) {
            self.value = value
            self.nextKey = nil
            self.prevKey = nil
        }
    }

    private let capacity: Int
    private var cacheDict: [Int: Node] = [:]
    private var headKey: Int?
    private var tailKey: Int?

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        if let node = cacheDict[key] {
        updateHead(key, node, nil)
        return node.value  
        } 
        return -1
        
    }

    func put(_ key: Int, _ value: Int) {
        if cacheDict.count == 0 {
            let node = Node(value)
            insertAtHead(node, key)
        } else if let node = cacheDict[key] {
            updateHead(key, node, value)
        } else if cacheDict.count < capacity {
            let node = Node(value)
            insertAtHead(node, key)
        } else {
           let node = Node(value)
           insertAtHead(node, key)
           deleteAtTail() 
        }

    }

    private func insertAtHead(_ node: Node, _ key: Int) {
        node.prevKey = nil
        cacheDict[key] = node
        guard let headKey = headKey, let headNode = cacheDict[headKey] else {
            //Empty cache
            self.headKey = key
            self.tailKey = key
            return
        }
        if (key != headKey) {
        node.nextKey = headKey
        headNode.prevKey = key
        self.headKey = key
        }
    }


    private func deleteAtTail() {
        guard let tailKey = tailKey, let tailNode = cacheDict[tailKey] else {
            return
        }
        if let prevKey = tailNode.prevKey, let prevNode = cacheDict[prevKey] { //Check for capacity = 1
            prevNode.nextKey = nil
            cacheDict[tailKey] = nil
            self.tailKey = prevKey
        } else { // Capacity is 1
            cacheDict[tailKey] = nil
            self.tailKey = headKey
        }
    }

    private func updateHead(_ key: Int,_ node: Node, _ value: Int?) {
        if let value = value {
            node.value = value
        }
        if let previousKey = node.prevKey {
            let previousNode = cacheDict[previousKey]! //Force unwrap because we are sure it will be there
            previousNode.nextKey = node.nextKey
            if let nextKey = node.nextKey { //Next key will be available only when there is previous key
                let nextNode = cacheDict[nextKey]! //Force unwrap because we are sure it will be there      
                nextNode.prevKey = previousKey
            } else { //if it was tail
                tailKey = previousKey
            }
        }
        insertAtHead(node, key)
    }
}
