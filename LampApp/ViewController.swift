//
//  ViewController.swift
//  LampApp
//
//  Created by MacBook Pro on 10/19/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBAction func toNewMeetup(_ sender: Any) {
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetupItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MeetupTableViewCell else {
            fatalError("No MeetupTableViewCell registered")
        }
        
        let currentItem = meetupItems[indexPath.row]
        cell.titleLabel.text = currentItem.title
        cell.dateLabel.text = currentItem.date.formatted(date: .abbreviated, time: .omitted)
        
        
        return cell
    }
    


}

