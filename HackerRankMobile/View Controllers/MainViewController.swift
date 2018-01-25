//
//  MainViewController.swift
//  
//
//  Created by Luke Solomon on 4/1/17.
//
//

import UIKit
import Firebase
import FirebaseAuth


class MainViewController: UIViewController {
    
    // Mark: - Variables
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionViewArray:[String] = ["Lukestagram", "Local Auth", "Sorting", "Data Structures", "Map View" , "HackerRank",  "Steam", "Jet Lag Calculator"]
    
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
            } else if identifier == "transitionToLukestagram" {
                 print("Opening Lukestagram")
            } else if identifier == "transitionToLoginStoryboard" {
                print("Logging in to Lukestagram")
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
        cell.imageView.image = UIImage.init(named: collectionViewArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewArray.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var idString = String()

        switch collectionViewArray[indexPath.row] {
            case "Steam":
                idString = "transitionToSteam"
            case "HackerRank":
                idString = "transitionToHRMobile"
            case "Lukestagram":
                let defaults = UserDefaults.standard
                if Auth.auth().currentUser != nil,
                  let userData = defaults.object(forKey: Constants.UserDefaults.currentUser) as? Data,
                  let user = NSKeyedUnarchiver.unarchiveObject(with: userData) as? FirebaseUser {
                    FirebaseUser.setCurrent(user, writeToUserDefaults: true)
                    idString = "transitionToLukestagram"
                } else {
                    idString = "transitionToLoginStoryboard"
                }
            case "Jet Lag Calculator":
                idString = "transitionToJetLagCalculator"
            case "Local Auth":
                idString = "transitionToAuth"
            case "Sorting":
                idString = "transitionToInsertionSort"
            case "Data Structures":
                idString = "transitionToDataStructures"
            case "Map View":
                idString = "transitionToMapView"
            
            default:
                print("Error in cell for row at index path")
        }
        
        self.performSegue(withIdentifier: idString, sender: self)
    }
}
