/*
Definition for a Node.
class Node {
    var val: Int
    var neighbors: [Node?]
    init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}
*/

class Solution {
    var map: [ObjectIdentifier: Node] = [:]
    func cloneGraph(_ node: Node?) -> Node? {
        guard let value = node else { return nil }
        return cloneNode(value)
    }

    func cloneNode(_ node: Node) -> Node {
        let id = ObjectIdentifier(node)
        if map[id] != nil {
            return map[id]!
        }
        let cloned = Node(node.val)
        map[id] = cloned
        for neighbor in node.neighbors {
            if let extractedNeighbor = neighbor { 
                cloned.neighbors.append(cloneNode(extractedNeighbor))
            }
        }
        return cloned
    }
}
