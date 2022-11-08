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
        description:
            """
            Программа:

            - 11:00 - 12:00 Диспетчеризация в свифт
                Докладывает @matv13v
                Разберем в деталях: в какой момент происходит выбор реализации
                функции/метода для вызова в Swift. А так же, как этот вызов происходит.

            - 12:00 - 13:00 Modern Collection View
                Докладывает @gellertk
                Поговорим о современных практиках и инструментах для работы с Collection View.
            """
    ),
    Meetup(
        title: "Sköll Bar",
        date: Date(timeIntervalSince1970: 1662739200),
        description:
            """
            - Обсудим [последний Apple Event](https://youtu.be/ux6zXguiqxM)
            - Выберем темы для следующих докладов
            - Может быть попишем код
            - И просто пообщаемся с единомышленниками
            """
    ),
]
