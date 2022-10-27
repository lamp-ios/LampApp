import UIKit

final class AddViewController: UIViewController {
    
    @IBOutlet private var saveBarButton: UIBarButtonItem!
    @IBOutlet private var dateTextField: UITextField!
    @IBOutlet private var locationTextField: UITextField!
    @IBOutlet private var descriptionTextField: UITextView!
    
    var delegate: ReturnDataProtocolDelegate?
    
    private let dateFormatter = DateFormatter()
    private let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        createDatePicker()
    }
    
    @IBAction private func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
   
    @IBAction private func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let dateText = dateTextField.text, !dateText.isEmpty else {
            dateTextField.shake()
            return
        }
        guard let locationText = locationTextField.text, !locationText.isEmpty else {
            locationTextField.shake()
            return
        }
        let date = dateFormatter.date(from: dateText)
        guard let date = date else {
            return
        }
        
        let meetup = Meetup(title: locationText, date: date)
        meetupItems.append(meetup)
        dismiss(animated: true)
        delegate?.reloadCells()
    }
    
    private func createToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneButton], animated: true)
        return toolBar
    }
    
    private func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .dateAndTime
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = createToolBar()
    }
    
    @objc private func donePressed() {
        self.dateTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
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
