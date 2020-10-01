import UIKit

class NewsfeedTableViewController: UITableViewController {
    
    var newsItems = [NewsItem]()
    
    // MARK: IBAction
    @IBAction func didSelectAdd(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Enter a title", message: nil, preferredStyle: .alert)
        alert.addTextField()
        
        let doneAction = UIAlertAction(title: "Done", style: .default) {
            [unowned alert] _ in let answer = alert.textFields![0]
            //print(answer.text!)
            let newNewsItem = NewsItem(title: answer.text!, favorited: false)
            self.newsItems.insert(newNewsItem, at: 0)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) {
            [unowned alert] _ in let _ = alert.textFields![0]
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(doneAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: How many rows in our section?
        return newsItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_template", for: indexPath)
        if let label = cell.viewWithTag(1) as? UILabel {
            label.font = UIFont.systemFont(ofSize: 32, weight: UIFont.Weight.thin)
            label.text = newsItems[indexPath.row].title
        }
        
        if let image = cell.viewWithTag(2) as? UIImageView {
            let imagePic: UIImage? = newsItems[indexPath.row].favorited ? UIImage(named: "star-filled") : UIImage(named: "star-hollow")
            image.image = imagePic
            image.frame = CGRect(x: 340, y: 25, width: 50, height: 50)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    // MARK: - Handle user interaction
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newsItems[indexPath.row].favorited.toggle()
        tableView.reloadData()
    }
    
    
    // MARK: - Swipe to delete functionality
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            newsItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }

}

