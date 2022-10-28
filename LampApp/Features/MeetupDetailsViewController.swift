import UIKit

class MeetupDetailsViewController: UIViewController {
    
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    public var meetup: Meetup?
    
    override func viewDidLoad() {
        locationLabel.text = meetup?.title
        descriptionLabel.text = meetup?.description
        dateLabel.text = meetup?.date.dayMonthYearFormat()
        
        super.viewDidLoad()
        
    }
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        
    }
    
}

extension Date {
    func dayMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: self)
    }
}
