import UIKit

final class MeetupDetailsViewController: UIViewController {
    
    @IBOutlet private var locationLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!

    public var meetup: Meetup?
    
    /// Функция которая вызывается при открытии
    override func viewDidLoad() {
        locationLabel.text = meetup?.title
        descriptionLabel.text = meetup?.description
        dateLabel.text = meetup?.date.dayMonthYearFormat()
        
        super.viewDidLoad()
    }
    
    /// Функция вызова изменения конкретного митапа
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "edit", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let destination = segue.destination as? UINavigationController,
            let addVC = destination.viewControllers[0] as? AddMeetupViewController
        else { return }
        addVC.meetup = meetup

    }
}
