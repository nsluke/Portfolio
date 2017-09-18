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
    
    
    
    
    var numbers = [10, 54, 16, 8, 60, 34, 22, 11]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func sortButtonTapped(_ sender: Any) {
        
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
        var cell = tableView.dequeueReusableCell(withIdentifier: "ReuseID", for: indexPath)
        
        return cell
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











