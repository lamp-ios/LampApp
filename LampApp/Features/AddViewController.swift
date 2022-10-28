import UIKit

final class AddViewController: UIViewController {
    
    @IBOutlet private var saveBarButton: UIBarButtonItem!
    @IBOutlet private var locationTextField: UITextField!
    @IBOutlet private var descriptionTextField: UITextView!
    @IBOutlet private var datePicker: UIDatePicker!
    
    var delegate: ReturnDataProtocolDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction private func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction private func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let locationText = locationTextField.text, !locationText.isEmpty else {
            locationTextField.shake()
            return
        }
        
        let meetup = Meetup(title: locationText, date: datePicker.date, description: descriptionTextField.text ?? "" )
        meetupItems.append(meetup)
        dismiss(animated: true)
        delegate?.reloadCells()
    }
}

extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}
