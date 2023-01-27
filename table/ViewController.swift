//
//  ViewController.swift
//  table
//
//  Created by Алина Власенко on 26.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let timeArray = ["9:00", "14:55", "22:20", "89:23"]
    private let statusArray = ["Сигнал", "Сигнал", "Сигнал", "Сигнал"]
    //додаю налаштування для таблиці
    private let myTable: UITableView = {
        let table = UITableView()
        
        table.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myTable)
        
        myTable.delegate = self
        myTable.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTable.frame = view.bounds
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier) as? MyTableViewCell else {
            return UITableViewCell() }
        
        let time = timeArray[indexPath.row]
        let status = statusArray[indexPath.row]
        cell.configure(time: time, status: status)
        
        return cell
        
    }
}
