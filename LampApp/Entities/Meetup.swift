import Foundation

struct Meetup {
    var title: String
    var date: Date
}

var meetupItems: [Meetup] = [
    Meetup(title: "№1", date: Date(timeIntervalSince1970: 1661583600)),
    Meetup(title: "№2", date: Date(timeIntervalSince1970: 1662739200)),
]
