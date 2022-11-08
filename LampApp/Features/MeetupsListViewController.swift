import UIKit

final class MeetupsListViewController: UITableViewController {
 
    private var selectedMeetup: Meetup?
    
    @IBAction func toNewMeetup(_ sender: Any) {
    self.performSegue(withIdentifier: "add", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMeetup = meetupItems[indexPath.row]
        performSegue(withIdentifier: "description", sender: nil)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetupItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "Cell",
            for: indexPath
        ) as? MeetupTableViewCell else {
            fatalError("No MeetupTableViewCell registered")
        }
        
        let currentItem = meetupItems[indexPath.row]
        cell.titleLabel.text = currentItem.title
        cell.dateLabel.text = currentItem.date.formatted(date: .abbreviated, time: .omitted)
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            meetupItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "add":
            guard
                let destination = segue.destination as? UINavigationController,
                let addVC = destination.viewControllers[0] as? AddMeetupViewController
            else { return }
            addVC.delegate = self
        case "description":
            guard
                let destinationTwo = segue.destination as? MeetupDetailsViewController
            else { return }
            destinationTwo.meetup =  selectedMeetup
        default:
            assertionFailure("Unexpected Segue Identifier")
        }
    }
}

extension MeetupsListViewController: AddMeetupViewControllerDelegate {
    func didSaveMeetup() {
        tableView.reloadData()
    }
}
