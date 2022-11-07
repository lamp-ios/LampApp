import UIKit

final class AddMeetupViewController: UIViewController {
    
    @IBOutlet private var saveBarButton: UIBarButtonItem!
    @IBOutlet private var locationTextField: UITextField!
    @IBOutlet private var descriptionTextField: UITextView!
    @IBOutlet private var datePicker: UIDatePicker!
    
    var delegate: ReturnDataProtocolDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

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
        
        let meetup = Meetup(title: locationText, date: datePicker.date, description: descriptionTextField.text ?? "" )
        meetupItems.append(meetup)
        dismiss(animated: true)
        delegate?.reloadCells()
    }
    
    private func configureUI() {
        
        let borderColor: UIColor = UIColor(
            red: 0.85,
            green: 0.85,
            blue: 0.85,
            alpha: 1.0
        )
        descriptionTextField.layer.borderColor = borderColor.cgColor
        descriptionTextField.layer.borderWidth = 0.5
        descriptionTextField.layer.cornerRadius = 5.0
        datePicker.subviews.first?.semanticContentAttribute = .forceRightToLeft
    }
    
}
