//
//  SecondViewController.swift
//  tableSegue
//
//  Created by Shiromu on 2019/08/31.
//  Copyright © 2019 Shiromu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var secondTable: UITableView!
    
    var tableIndex: IndexPath!
    
    var second1Array = [String]()
    var second2Array = [String]()
    var second3Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        second1Array = ["1.1","1.2","1.3"]
        second2Array = ["2.1","2.2","2.3"]
        second3Array = ["3.1","3.2","3.3"]
        
        secondTable.dataSource = self
        secondTable.delegate = self
        

        
    }
    
    
    // セルが押されたとき
    func tableView(_ tableView: UITableView, didSelectRowAt index: IndexPath ){
        tableIndex = index
        performSegue(withIdentifier: "toResult",sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableIndex.row {
        case 0:
            return second1Array.count
        case 1:
            return second2Array.count
        case 2:
            return second3Array.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secCell")
        switch tableIndex.row {
        case 0:
            cell?.textLabel?.text = second1Array[indexPath.row]
        case 1:
            cell?.textLabel?.text = second2Array[indexPath.row]
        case 2:
            cell?.textLabel?.text = second3Array[indexPath.row]
        default:
            break
        }
        return cell!
    }
    
    

}
