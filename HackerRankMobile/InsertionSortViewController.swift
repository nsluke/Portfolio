//
//  InsertionSortViewController.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 9/18/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit

class InsertionSortViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var numbers = [10, 54, 16, 8, 60, 34, 22, 11]
    var sortTypes = ["Insertion", "Selection", "Quick", "Unsort"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
//        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sortButtonTapped(_ sender: Any) {
        
        switch pickerView.selectedRow(inComponent: 0) {
        case 0:
            numbers = numbers.insertionSort()
        case 1:
            numbers = numbers.selectionSort()
        case 2:
            numbers = numbers.quickSort()
        case 3:
            numbers = [10, 54, 16, 8, 60, 34, 22, 11]
        default:
            numbers.sort()
        }
        
        tableView.reloadData()
    }
    
    func randomizeArray(length:Int ) -> [Int] {
        var result:[Int] = []
        for i in 0..<length {
            result.append(Int(arc4random_uniform(20) + 1))
        }
        return result
    }

}

extension InsertionSortViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //nothing...yet
    }
}

extension InsertionSortViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseID", for: indexPath)
        
        cell.textLabel?.text = String(numbers[indexPath.row])
        
        return cell
    }
    
}

extension InsertionSortViewController:UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sortTypes[row]
    }
    
}

extension InsertionSortViewController:UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sortTypes.count
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

extension Array where Element:Comparable {
    
    func insertionSort() -> Array<Element> {
        //check for trivial case
        guard self.count > 1 else {
            return self
        }
        
        //mutated copy
        var output: Array<Element> = self
        
        for primaryindex in 0..<output.count {

            let key = output[primaryindex]
            var secondaryindex = primaryindex
            
            while secondaryindex > -1 {
                if key < output[secondaryindex] {
                    //move to correct position
                    output.remove(at: secondaryindex + 1)
                    output.insert(key, at: secondaryindex)
                    
                }
                secondaryindex -= 1
            }
        }
        return output
    }
    
    func selectionSort() -> Array<Element> {
        // Check for trivial case
        guard self.count > 1 else {
            return self
        }
        
        // mutated copy
        var output:Array<Element> = self
        
        for primaryindex in 0..<output.count {
            
            var minimum = primaryindex
            var secondaryindex = primaryindex + 1
            
            while secondaryindex < output.count {
                //store lowest value as minimum
                if output[minimum] > output[secondaryindex] {
                    minimum = secondaryindex
                }
                secondaryindex += 1
            }
            //swap minimum value with array iteration
            if primaryindex != minimum {
                swap(&output[primaryindex], &output[minimum])
            }
        }
        return output
    }
    
}

extension Array where Element: Comparable {
    
    mutating func quickSort() -> Array<Element> {
        
        func qSort(start startIndex: Int, _ pivot: Int) {
            
            if (startIndex < pivot) {
                let iPivot = qPartition(start: startIndex, pivot)
                qSort(start: startIndex, iPivot - 1)
                qSort(start: iPivot + 1, pivot)
            }
        }
        
        qSort(start: 0, self.endIndex - 1)
        return self
    }
    
    //sorts selected pivot
    mutating func qPartition(start startIndex: Int, _ pivot: Int) -> Int {
        
        var wallIndex: Int = startIndex
        
        //compare range with pivot
        for currentIndex in wallIndex..<pivot {
            
            if self[currentIndex] <= self[pivot] {
                if wallIndex != currentIndex {
                    swap(&self[currentIndex], &self[wallIndex])
                }
                
                //advance wall
                wallIndex += 1
            }
        }
        
        //move pivot to final position
        if wallIndex != pivot {
            swap(&self[wallIndex], &self[pivot])
        }
        return wallIndex
    }

}
