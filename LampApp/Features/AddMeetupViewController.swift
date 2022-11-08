import UIKit

protocol AddMeetupViewControllerDelegate: AnyObject {
    func didSaveMeetup()
}

final class AddMeetupViewController: UIViewController {
    
    @IBOutlet private var saveBarButton: UIBarButtonItem!
    @IBOutlet private var locationTextField: UITextField!
    @IBOutlet private var descriptionTextField: UITextView!
    @IBOutlet private var datePicker: UIDatePicker!
    
    public var meetup: Meetup?
  
    weak var delegate: AddMeetupViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fillMeetupInfo()
    }
    
    private func fillMeetupInfo() {
        guard let meetup else {
            return
        }
        
        locationTextField.text = meetup.title
        descriptionTextField.text = meetup.description
        datePicker.date = meetup.date
    }
    
    @IBAction private func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction private func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        guard let locationText = locationTextField.text, !locationText.isEmpty else {
            locationTextField.shake()
            return
        }
        guard let descriptionText = descriptionTextField.text, !descriptionText.isEmpty else {
            descriptionTextField.shake()
            return
        }
        
        let meetup = Meetup(title: locationText, date: datePicker.date, description: descriptionTextField.text)
        meetupItems.append(meetup)
        dismiss(animated: true)
        delegate?.didSaveMeetup()
    }
    
    private func configureUI() {
        
        let borderColor = UIColor(
            red: 0.85,
            green: 0.85,
            blue: 0.85,
            alpha: 1.0
        )
        descriptionTextField.layer.borderColor = borderColor.cgColor
        descriptionTextField.layer.borderWidth = 0.5
        descriptionTextField.layer.cornerRadius = 5.0
    }
    
}
