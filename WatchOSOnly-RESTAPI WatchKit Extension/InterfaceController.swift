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
    
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
    
    //let tableData = ["One", "Two", "Three", "Four", "Five", "Six"]
    var tableData = [String]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        requestGet()
        //loadTableData()
       
    }


    func requestGet() {
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
                
//                let todoItems = self.parseJSON(data: data)!
//                //self.tableData = self.parseJSON(data: data)!
//
//                guard let todoItemModel = todoItems else { return }
//                //guard let todoItemModel = self.tableData else { return }
//
//                for toDo in self.tableData {
//                    print(toDo.self)
//                }
                
                let todoItem = self.parseJSON(data: data)
               
                guard let todoItemModel = todoItem else { return }
                
                for toDo in todoItemModel {
                    print(toDo.title)
                    self.tableData.append(toDo.title)
                    
                }
                
                DispatchQueue.main.async {
                    self.loadTableData()
                }

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
    
    //let todoItems: Array<Any> = []
    
    private func loadTableData() {
              
        tableView.setNumberOfRows(tableData.count, withRowType: "RowController")
        
        for (index, rowModel) in tableData.enumerated() {

            if let rowController = tableView.rowController(at: index) as? RowController {
                rowController.rowLabel.setText(rowModel)
            }
        }

//        for (index, rowModel) in todoItems?.enumerated(){
//            if let rowController = tableView.rowController(at: index) as? RowController {
//                RowController.rowLabel.setText(rowModel)
//            }
//        }
        
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        pushController(withName: "DetailInterfaceController", context: tableData[rowIndex])
    }

}
