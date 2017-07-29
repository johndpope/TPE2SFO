//
//  ClothObjectManager.swift
//  TPE2SFO
//
//  Created by zip520123 on 2017/7/29.
//  Copyright © 2017年 zip520123. All rights reserved.
//

import UIKit
import SwiftyJSON
class ClothObject: NSObject {
    // MARK: - Properties
    
    let image : UIImage
    let json : JSON

    init(image : UIImage , json : JSON) {
        self.image = image
        self.json = json
    }
    

}
