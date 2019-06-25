import Cocoa

class node{
    var value : Int
    var next : node?
    
    init(value : Int){
        self.value = value
    }
}

class list{
    
    var head : node
    
    init(value : Int){
        head = node(value: value)
        head.next = nil
    }
    
    func printList(){
        printList(uno: &self.head)
    }
    private func printList(uno : inout node){
        print(uno.value)
        if uno.next != nil {
            return printList(uno : &uno.next!)
        }
        
    }
    
    func addNode(add_this_node : Int){
        addNode(value: add_this_node, traverse: &head)
    }
    
    private func addNode(value : Int, traverse : inout node){
        var addThis : node
        if traverse.next != nil{
            return addNode(value : value, traverse : &traverse.next!)
        }else{
            addThis = node(value: value)
            traverse.next = addThis
        }
        
    }
    
}


var first = list(value : 16)
first.addNode(add_this_node: 22)
first.addNode(add_this_node: 36)
first.printList()
