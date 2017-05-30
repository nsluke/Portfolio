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
    
    var collectionViewArray:[String] = ["Steam", "H R Mobile",""]
    
    
    // Mark: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let result = RealmHelper.retrieveRealmObjects()
//        collectionViewArray = result
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "transitionToDetail" {
                NetworkHelper.sharedInstance.getUserProfileInfo()
            }
        }
        // var detailVC:DetailViewController =
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

}
