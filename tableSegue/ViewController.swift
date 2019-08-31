//
//  ViewController.swift
//  tableSegue
//
//  Created by Shiromu on 2019/08/31.
//  Copyright © 2019 Shiromu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var firstArray = [String]()
    var tableIndex: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstArray = ["1", "2", "3"]
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstArray.count
    }
    
    // セル設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell")
        cell?.textLabel?.text = firstArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt index: IndexPath ){
        tableIndex = index
        performSegue(withIdentifier: "toSecond",sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond"{
            let VC = segue.destination as! SecondViewController
            //インデックスを渡して選択したものと同じ場所を読み込む
            VC.tableIndex = tableIndex
        }
    }
    


}

