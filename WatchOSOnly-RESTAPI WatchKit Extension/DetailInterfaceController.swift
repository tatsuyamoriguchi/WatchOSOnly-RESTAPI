//
//  DetailInterfaceController.swift
//  WatchOSOnly-RESTAPI WatchKit Extension
//
//  Created by Tatsuya Moriguchi on 9/19/20.
//  Copyright © 2020 Tatsuya Moriguchi. All rights reserved.
//

import Foundation
import WatchKit

class DetailInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var detailLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let detailData = context as? String {
            detailLabel.setText(detailData)
        }
    }
    
    override func willActivate() {
        
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }



}


