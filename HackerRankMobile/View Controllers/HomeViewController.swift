//
//  File.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 10/17/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    
    var posts = [Post]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserService.posts(for: FirebaseUser.current) { (posts) in
            self.posts = posts
            self.tableView.reloadData()
        }
    }
    
    
    
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostImageCell", for: indexPath)
        cell.backgroundColor = .red
        
        return cell
    }
}
