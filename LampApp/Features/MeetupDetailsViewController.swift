import UIKit

final class MeetupDetailsViewController: UIViewController {
    
    @IBOutlet private var locationLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!

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
