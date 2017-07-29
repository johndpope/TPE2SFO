//
//  ClothTableVC.swift
//  TPE2SFO
//
//  Created by zip520123 on 2017/7/29.
//  Copyright © 2017年 zip520123. All rights reserved.
//

import UIKit
import SwiftyJSON

class ClothTableVC: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    var clothList = [ClothObject]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clothList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClothTableViewCell", for: indexPath) as! ClothTableViewCell
        let clothObj = clothList[indexPath.row]
        cell.clothImage.image = clothObj.image
        cell.clothText.text = getTextFrom(json : clothObj.json)
        return cell
    }
    
    
    func getTextFrom(json: JSON) -> String{
        let jsonArray = json["responses"][0]["labelAnnotations"].arrayValue
        var detectS = ""
        for item in jsonArray {
            let des = item["description"].stringValue
            detectS.append(des)
            
            detectS.append("\n")
        }
        return detectS
    }
    



}
