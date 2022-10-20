//
//  Model.swift
//  LampApp
//
//  Created by MacBook Pro on 10/19/22.
//

import Foundation

struct Meetup {
    var title: String
    var date: Date
    
}

var meetupItems: [Meetup] = [
    Meetup(title: "№1", date: Date(timeIntervalSince1970: 1661583600)), Meetup(title: "№2", date: Date(timeIntervalSince1970: 1662739200))
]

func addItem(item: Meetup) {
    meetupItems.append(item)
}

func removeItem(at index: Int) {
    meetupItems.remove(at: index)
}


