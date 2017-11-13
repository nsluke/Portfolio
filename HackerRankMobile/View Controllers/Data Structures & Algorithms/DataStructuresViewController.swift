//
//  DataStructuresViewController.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 9/27/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit

class DataStructuresViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    var list = LinkedList.init(array: [Int](1...50))
    var palindrome = LinkedList.init(array: [1,2,3,4,4,3,2,1])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = list.description
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reverseButtonTapped(_ sender: Any) {
        list.reverse()
        textView.text = list.description
    }
    
    @IBAction func palindromeButtonTapped(_ sender: Any) {
        var message = ""
        
        if list.isPalindrome(palindrome) == true {
            message = "It's a Palindrome!"
        } else {
            message = "It's not a Palindrome."
        }
        
        let alertController = UIAlertController(title: "Palindrome Check Completed", message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {
            
        }
    }
    
}
