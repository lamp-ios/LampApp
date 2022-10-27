import UIKit
protocol ReturnDataProtocolDelegate: AnyObject {
    func reloadCells()
}

final class MeetupsListViewController: UITableViewController, ReturnDataProtocolDelegate {
    func reloadCells() {
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "add" else { return }
        guard
            let destination = segue.destination as? UINavigationController,
            let addVC = destination.viewControllers[0] as? AddViewController
        else { return }
        
        addVC.delegate = self
    }
    
    @IBAction func toNewMeetup(_ sender: Any) {
        self.performSegue(withIdentifier: "add", sender: nil)
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
}
