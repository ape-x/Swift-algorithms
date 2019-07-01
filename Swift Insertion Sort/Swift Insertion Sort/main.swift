import Cocoa

var array = [Int]()

for _ in 0...100{
    let appendThisNumber = Int(arc4random()%100)
    array.append(appendThisNumber)
}

func insertionSort(unsorted_array array : inout[Int]){
    var iteratii = 0
    for i in 1...array.count-1{
        for j in (1...i).reversed(){
            iteratii+=1
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
    print("\niteratii\t\(iteratii)")
}

insertionSort(unsorted_array: &array)
