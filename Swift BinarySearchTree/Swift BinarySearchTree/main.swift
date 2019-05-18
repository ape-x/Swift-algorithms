import Foundation

class binarySearchTree{
    
    var value : Int
    var parent : binarySearchTree?
    var left : binarySearchTree?
    var right : binarySearchTree?
    
    var isLeaf : Bool{
        return right == nil && left == nil
    }
    
    init(value : Int){
        self.value = value
    }
    
    func insert(value : Int){
        insert(value : value, parent : self)
    }
    private func insert(value : Int, parent : binarySearchTree){
        if value < self.value{
            if let left = left{
                left.insert(value: value, parent : self)
            }else{
                left = binarySearchTree(value : value)
                left?.parent = self
            }
        }
        if value > self.value{
            if let right = right{
                right.insert(value : value , parent : self)
            }else{
                right = binarySearchTree(value : value)
                right?.parent = self
            }
        }
    }
    func printTree()->String{
        var description = ""
        if let left = left{
            description+="\(left.printTree()) < - "
        }
        description+="\(value)"
        if let right = right{
            description+=" - > \(right.printTree())"
        }
        return description
    }
    
    func searchTree(value : Int)->binarySearchTree?{
        
        if value == self.value{
            return self
        }
        if value < self.value{
            if let left = left{
                return left.searchTree(value: value)
            }
        }else{
            if let right = right{
                return right.searchTree(value: value)
            }
        }
        return nil
    }
    
    func searchFor(value : Int)->Bool{
        if value == self.value{
            return true
        }
        if value < self.value{
            if let left = left{
                if left.searchFor(value : value){
                    return true
                }else{
                    return false
                }
            }else{
                return false
            }
        }
        if value > self.value{
            if let right = right{
                if right.searchFor(value : value){
                    return true
                }else{
                    return false
                }
            }else{
                return false
            }
        }
        return false
        
    }
    
    func height()->Int{
        if self.left == nil && self.right == nil{
            return 0
        }else{
            return 1+max(left?.height() ?? 0 , right?.height() ?? 0)
        }
    }
    
    func depth(value : Int)->Int{
        var depth = 0
        guard var tree = searchTree(value : value) else { return 0}
        while let parent = tree.parent{
            tree = parent
            depth+=1
        }
        return depth
    }
    
    
    
}

var tree = binarySearchTree(value : 50)

for i in 40...60{
    tree.insert(value : i)
}

print(tree.printTree())
print("Tree height \t\(tree.height())")

