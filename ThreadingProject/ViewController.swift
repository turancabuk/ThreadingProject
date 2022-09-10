//
//  ViewController.swift
//  ThreadingProject
//
//  Created by Turan Çabuk on 10.09.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    let imageString = ["https://images.hdqwalls.com/wallpapers/skye-united-kingdom-8k-yh.jpg","https://images.hdqwalls.com/wallpapers/lone-tree-oak-5k-bx.jpg"]
    var data = Data()
    var tracker = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        data = try! Data(contentsOf: URL(string: imageString[tracker])!)
        imageView.image = UIImage(data: data)
       
        
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.action, target: self, action: #selector(changePhoto))
    }
    @objc func changePhoto(){
        
        if tracker == 0 {
            tracker += 1
        }else{
            tracker -= 1
        }
        
        data = try! Data(contentsOf: URL(string: imageString[tracker])!)
        imageView.image = UIImage(data: data)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 48
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "threading test"
        return cell
    }


}

