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
    
    @IBOutlet weak var idLabel: WKInterfaceLabel!
    @IBOutlet weak var userIDLabel: WKInterfaceLabel!
    @IBOutlet weak var completedLabel: WKInterfaceLabel!
    @IBOutlet weak var todoLabel: WKInterfaceLabel!
    
  
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Prepare URL
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
//        // Set HTTP Request Header
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-type")

        let newTodoItem = UserResponseModel(userId: 300, id: 201, title: "Urgent task 2", completed: true)
        let jsonData = try? JSONEncoder().encode(newTodoItem)
        
        request.httpBody = jsonData


//        //HTTP Request Parameters which will be sent in HTTP Request Body
//        let postString = "userId=300&title=My urgent task&completed=false";
//        // Set HTTP Request Body
//        request.httpBody = postString.data(using: String.Encoding.utf8);
//        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Check for error
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            guard let data = data else { return  }
            
            do {
                let todoItemModel = try JSONDecoder().decode(UserResponseModel.self, from: data)
                
                let idString = String(todoItemModel.id)
                let idText = "TODO ID: \(idString)"
                self.idLabel.setText(idText)
                
                let userIDString = String(todoItemModel.userId)
                let userIdText = "User ID: \(userIDString)"
                self.userIDLabel.setText(userIdText)
                
                switch todoItemModel.completed {
                case true:
                    let completedString = "Completed"
                    self.completedLabel.setText(completedString)
                case false:
                    let completedString = "Not Completed"
                    self.completedLabel.setText(completedString)

                }
                
                
                self.todoLabel.setText(todoItemModel.title)

                print("")
                print("POST data")
                print("Rsponse data: \n \(todoItemModel)")
                print("Todo Title: \(todoItemModel.title)")
                print("Todo id: \(todoItemModel.id)")
                print("Todo Completed: \(todoItemModel.completed)")
                print("User ID: \(todoItemModel.userId)")
                
            } catch let jsonErr {
                print("JSON Error: ")
                print(jsonErr)
            }
            
            
            // Convert HTTP Response to a String
//            if let data = data, let dataString = String(data: data, encoding: .utf8) {
//                print("Response data string: \n \(dataString)")
//            }
            
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
