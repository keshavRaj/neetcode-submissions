class MyLinkedList {

    class Node{
        let value: Int
        var next: Node? 
        init(_ val: Int) {
            self.value = val
        }
    }
    private var head: Node?

    init() {
        
    }
    
    func get(_ index: Int) -> Int {
        guard let head = head else { return -1 }
        var cur: Node? = head
        var count = 0
        while(cur != nil) {
            if count == index {
                return cur!.value
            }
            count += 1
            cur = cur?.next
        }
        return -1
    }
    
    func addAtHead(_ val: Int) {
        let node = Node(val)
        node.next = head
        head = node
        
    }
    
    func addAtTail(_ val: Int) {
        let node = Node(val)
        guard let head = head else { 
            head = node
            return
        }
        var cur: Node? = head
        while(cur?.next != nil) {
            cur = cur?.next
        }
        cur?.next = node
        
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        let node = Node(val)
         if index == 0 {
                node.next = head
                head = node
                return
            }
        guard let head = head else {
            return
        }
        var cur: Node? = head
        var curIndex = 0
        while(cur?.next != nil && curIndex < index - 1) {
            cur = cur?.next
            curIndex += 1
        }
        if cur?.next != nil {
            node.next = cur?.next
            cur?.next = node
        } else if (curIndex + 1) == index {
            cur?.next = node
        } 
    }
    
    func deleteAtIndex(_ index: Int) {
        guard let extractedHead = head else { return }
        if index == 0 {
            let temp = extractedHead.next
            extractedHead.next = nil
            head = temp
            return
        }
        var curIndex = 0
        var cur: Node? = extractedHead
        while(cur?.next != nil && curIndex < index - 1) {
            cur = cur?.next
            curIndex += 1
        }
        if cur?.next != nil {
            cur?.next = cur?.next?.next
        }
        
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */