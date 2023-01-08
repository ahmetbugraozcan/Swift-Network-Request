//
//  ViewController.swift
//  NetworkRequestExample
//
//  Created by Ahmet Buğra Özcan on 7.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFakeData()
        convertObjectToJSON()
    }
    
    func convertObjectToJSON(){
        
        let todoModel = TodoModel(userId: 1, id: 1, title: "Test title", completed: false)

        do {
            let jsonData = try JSONEncoder().encode(todoModel)
            print(String(data: jsonData, encoding: .utf8)!)
        }
        catch {
            print(error)
        }
        
    }
    
    func fetchFakeData(){
        guard let requestURL: URL = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {
            return
        }
        
        URLSession.shared.dataTask(with: requestURL) { data, response, error in
            guard data != nil, error == nil else {
                // some error
                return
            }
            
            do{
                let todoModel = try JSONDecoder().decode(TodoModel.self, from: data!)
                print(todoModel)
            } catch{
                print(error)
            }
            
            
        }.resume()
    }
    
    
    
}

