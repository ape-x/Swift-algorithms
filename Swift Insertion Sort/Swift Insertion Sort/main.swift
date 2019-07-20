import Cocoa

var array = [Int]()

for _ in 0...100{
    let appendThisNumber = Int(arc4random()%100)
    array.append(appendThisNumber)
}

func insertionSort(unsorted_array array : inout[Int]){
    
    guard array.count > 0 else{
        return
    }
    
    for i in 1...array.count-1{
        for j in (1...i).reversed(){

            if array[j-1]>array[j]{
                array.swapAt(j, j-1)
            }else{
                break
            }
        }
    }
    for i in array{
        print(i)
    }
}

insertionSort(unsorted_array: &array)
