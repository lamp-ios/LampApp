import Foundation

struct Meetup {
    var title: String
    var date: Date
    var description: String
}

var meetupItems: [Meetup] = [
    Meetup(
        title: "Офис ZeBrains",
        date: Date(timeIntervalSince1970: 1661583600),
        description: "сосамба"
    ),
    Meetup(
        title: "Sköll Bar",
        date: Date(timeIntervalSince1970: 1662739200),
        description: "ебен бобен"

    ),
]
