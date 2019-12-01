//
//  ViewController.swift
//  SushiMenu
//
//  Created by Hiroki Son on 2019/11/27.
//  Copyright © 2019 19cm0117. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var sushiMenu: UITableView!
    
    @IBOutlet weak var sushiNeta: UIImageView!
    let sushis = SushiUtil().getSushiCSV()//listを取得
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //let sushis = SushiUtil().getSushiCSV()
        
        for sushi in sushis{
            dump(sushi)
            //print(sushis)
        //tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReUseIdenfier: "cell")
            sushiMenu.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
            sushiMenu.allowsMultipleSelectionDuringEditing = true
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)番目の行が選択されました。")
        
    }
    
}
extension ViewController: UITableViewDelegate{
    
}
extension ViewController: UITableViewDataSource{
          func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return sushis.count
    
          }
      
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              // セルを取得する
              let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
              
           
            cell.setLabel(label: "sushi")
            cell.setLabel(label: sushis[indexPath.row].name + ":" + sushis[indexPath.row].kanji)
            
              return cell
          }
}

