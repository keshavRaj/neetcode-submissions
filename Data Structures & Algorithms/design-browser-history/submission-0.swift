class BrowserHistory {

    private class Node {
        let url: String
        var next: Node?
        weak var prev: Node?

        init(_ url: String) {
            self.url = url
        }        
    }
    private var head: Node?
    private var curNode: Node?


    init(_ homepage: String) {
       let node = Node(homepage)
       head = node
       curNode = node
    }
    
    func visit(_ url: String) {
        let node = Node(url)
        if curNode?.prev == nil {
            head?.next = node
            node.prev = head
        } else {
            curNode?.next = node
            node.prev = curNode
        }
        curNode = node
    }
    
    func back(_ steps: Int) -> String {
        var cur = curNode
        var curStep = steps
        while(cur?.prev != nil && curStep > 0) {
            cur = cur?.prev
            curStep -= 1
        }
        curNode = cur
        return cur!.url
    }
    
    func forward(_ steps: Int) -> String {
        var curStep = 0
        var cur = curNode
        while(cur?.next != nil && curStep < steps) {
            cur = cur?.next
            curStep += 1
        }
        curNode = cur
        return cur!.url
    }
}

/**
 * Your BrowserHistory object will be instantiated and called as such:
 * let obj = BrowserHistory(homepage)
 * obj.visit(url)
 * let ret_2: String = obj.back(steps)
 * let ret_3: String = obj.forward(steps)
 */