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
    
    
    @IBOutlet weak var idLabel: WKInterfaceLabel!
    @IBOutlet weak var userIDLabel: WKInterfaceLabel!
    @IBOutlet weak var completedLabel: WKInterfaceLabel!
    @IBOutlet weak var todoLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let detailData = context as? String {
        
            //let idString = String(detailData.)
            //idLabel.setText()
            todoLabel.setText(detailData)
            
            
            
        }
    }
    
    override func willActivate() {
        
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }



}


