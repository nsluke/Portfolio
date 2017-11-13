//
//  MainViewController.swift
//  
//
//  Created by Luke Solomon on 4/1/17.
//
//

import UIKit


class MainViewController: UIViewController {
    
    // Mark: - Variables
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionViewArray:[String] = ["Steam", "H R Mobile","Makestagram", "Jet Lag Calculator", "Touch ID", "Insertion Sort", "Data Structures"]
    
    
    // Mark: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "transitionToSteam" {
//                NetworkHelper.sharedInstance.getUserProfileInfo()
            } else if identifier == "transitionToJetLagCalculator" {
                print("Opening Jet Lag Calculator")
            } else if identifier == "transitionToMakestagram" {
                 print("Opening Makestagram")
            }
        }
    }
    
    @IBAction func unwindToCollectionView(segue: UIStoryboardSegue) {
        if let identifier = segue.identifier {
            print("Identifier \(identifier)")
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReuseID", for: indexPath) as! CustomCollectionViewCell
        
        cell.mainLabel.text = collectionViewArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewArray.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var idString:String = ""
//        var destinationVC:UIViewController?
        switch collectionViewArray[indexPath.row] {
            case "Steam":
                idString = "transitionToSteam"
            case "H R Mobile":
                idString = "transitionToHRMobile"
            case "Makestagram":
                idString = "transitionToMakestagram"
            case "Jet Lag Calculator":
                idString = "transitionToJetLagCalculator"
            case "Touch ID":
                idString = "transitionToAuth"
            case "Insertion Sort":
                idString = "transitionToInsertionSort"
            case "Data Structures":
                idString = "transitionToDataStructures"
            default:
                print("Error in cell for row at index path")
        }
        
        self.performSegue(withIdentifier: idString, sender: self)
    }
}
