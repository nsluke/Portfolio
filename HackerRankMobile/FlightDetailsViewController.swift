//
//  FlightDetailsViewController.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 9/13/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit

class FlightDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var departureCityLabel: UILabel!
    @IBOutlet weak var departureCityTextField: UITextField!
    
    @IBOutlet weak var departureTimeLabel: UILabel!
    @IBOutlet weak var departureTimeTextField: UITextField!
    @IBOutlet weak var departureTimeSegmentedControl: UISegmentedControl!
    
    
    
    
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

}
