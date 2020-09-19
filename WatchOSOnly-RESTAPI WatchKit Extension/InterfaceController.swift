//
//  InterfaceController.swift
//  WatchOSOnly-RESTAPI WatchKit Extension
//
//  Created by Tatsuya Moriguchi on 9/18/20.
//  Copyright © 2020 Tatsuya Moriguchi. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string: \n \(dataString)")
                
                let todoItem = self.parseJSON(data: data)
                guard let todoItemModel = todoItem else { return }
                
                for toDo in todoItemModel {
                    print(toDo.title)
                    
                }
                
                
                //print("todo item title = \(todoItemModel.title)")
            }
        }
        task.resume()

       
    }

    func parseJSON(data: Data) -> [UserResponseModel]? {
        var returnValue: [UserResponseModel]?
        
        do {
            returnValue = try JSONDecoder().decode([UserResponseModel].self, from: data)
            
        } catch {
            print("Error took place 1 \(error)")
        }
        return returnValue
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
