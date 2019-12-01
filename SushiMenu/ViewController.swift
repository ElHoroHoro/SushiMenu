//
//  ViewController.swift
//  SushiMenu
//
//  Created by Hiroki Son on 2019/11/27.
//  Copyright © 2019 19cm0117. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    //tableview
    @IBOutlet weak var sushiMenu: UITableView!
    //画像表示欄
    @IBOutlet weak var sushiNeta: UIImageView!
    //説明文欄
    @IBOutlet weak var memoStr: UILabel!
    
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
        memoStr.layer.cornerRadius = 10.0
        memoStr.layer.backgroundColor = UIColor.orange.cgColor
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //0から数えないために
        print("\(indexPath.row + 1)番目の行が選択されました。")
        //TODO
        //漢字名と説明
        memoStr.text = sushis[indexPath.row].kanji + ":  " + sushis[indexPath.row].memo
        
        //画像表示
        //sushiNeta.image = UIImage(contentsOfFile: "String(sushis[indexPath.row].photo)")
        let imageNeta = UIImage(named: sushis[indexPath.row].photo)
        
        sushiNeta.image = imageNeta
        
        print(sushis[indexPath.row].photo)
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
              
            cell.setLabel(label: sushis[indexPath.row].name + " : " + sushis[indexPath.row].english)
            
              return cell
          }
}

