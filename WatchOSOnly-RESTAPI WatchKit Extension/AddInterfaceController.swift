//
//  AddInterfaceController.swift
//  WatchOSOnly-RESTAPI WatchKit Extension
//
//  Created by Tatsuya Moriguchi on 9/20/20.
//  Copyright © 2020 Tatsuya Moriguchi. All rights reserved.
//

import WatchKit
import Foundation


class AddInterfaceController: WKInterfaceController {
    
    
  
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Prepare URL
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
//        // Set HTTP Request Header
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
//        request.setValue("application/json", forHTTPHeaderField: "Content-type")
//
        //HTTP Request Parameters which will be sent in HTTP Request Body
        let postString = "userId=300&title=My urgent task&completed=false";
        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Check for error
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Convert HTTP Response to a String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string: \n \(dataString)")
            }
            
        }
        task.resume()

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
