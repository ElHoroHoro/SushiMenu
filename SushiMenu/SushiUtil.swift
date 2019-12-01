//
//  SushiUtil.swift
//  SushiMenu
//
//  Created by Hiroki Son on 2019/11/27.
//  Copyright © 2019 19cm0117. All rights reserved.
//

import Foundation

class SushiUtil {
    //CSV Loadどこに寿司ネタある？　ここだよ
    func getSushiCSV() -> [Sushi]{
        var sushiArray: [Sushi] = []
        guard let sushiFile = Bundle.main.path(forResource: "menu", ofType: "csv") else{
            print("見つからない")
            exit(99)
        }
        
        //dump(sushiFile)
        
        let sushiCSVData = try! String(contentsOfFile: sushiFile, encoding: .utf8)
        
        //1行ずつ取り出して、カンマ区切りごとに区切る
        sushiCSVData.enumerateLines { (line, stop) in
            let sushiDataArray = line.components(separatedBy: ",")
           
            let sushi = Sushi(name: sushiDataArray[0],
                              kanji: sushiDataArray[1],
                              english: sushiDataArray[2],
                              memo: sushiDataArray[3])
            
            sushiArray.append(sushi)
            
            
        }
        
        print(sushiCSVData)
        return sushiArray
    }
    
}
