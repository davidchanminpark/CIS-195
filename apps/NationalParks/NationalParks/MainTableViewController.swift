//
//  MainTableViewController.swift
//  NationalParks
//
//  Created by Chanmin Park on 11/12/20.
//

import UIKit
import Kingfisher
import Firebase

struct APIResponse: Codable {
    let data: [Park]
}
struct Park: Codable {
    let fullName: String
    let description: String
    let images: [ParkImage]
    let designation: String
}

struct ParkImage: Codable {
    let url: String
}

class ParkTableViewCell: UITableViewCell {
    @IBOutlet weak var parkNameLabel: UILabel!
    @IBOutlet weak var parkTypeLabel: UILabel!
    @IBOutlet weak var parkImageView: UIImageView!
    
}

class MainTableViewController: UITableViewController {
    
    
    let db = Firestore.firestore()
    var rowSelected = 0
    var parks = [Park]()
    let apiEndpoint = "https://developer.nps.gov/api/v1/parks?limit=30&api_key=R7e9pDOuzEgOzGwEgcXlAmRWVfCDUgcuXJS2nGP1"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        fetchParkData()
//        writeParkData()
        readParkData()
    }
    
    private func fetchParkData() {
        let url = URL(string: apiEndpoint)!
        let urlRequest = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error: API reqest failed")
                return
            }
            if let APIResponse = try? JSONDecoder().decode(APIResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.parks = APIResponse.data
                    self.tableView.reloadData()
                }
            }
        }

        task.resume()
    }
    
    private func writeParkData() {
        for park in parks {
            db.collection("parks").document(park.fullName).setData([
                "fullName": park.fullName,
                "description": park.description,
                "type": park.designation,
                "imageURL": !park.images.isEmpty ? park.images[0].url : ""
            ]) { err in
                if let err = err {
                    print("error writing document: \(err)")
                } else {
                    print("doc successfully written")
                }
            }
        }
    }
    
    private func readParkData() {
        db.collection("cities").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let park = document.data()
                    let parkImages: [ParkImage] = park.imageURL == "" ? [] : [park.imageURL]
                    let newPark = Park(fullName: park.fullName, images: parkImages, description: park.description, designation: park.type)
                    parks.append(newPark)
                }
            }
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParkCell", for: indexPath) as! ParkTableViewCell
        
        let park = parks[indexPath.row]
        
        if !park.images.isEmpty {
            let parkImageURL = URL(string: park.images[0].url)
            cell.parkImageView?.kf.setImage(with: parkImageURL)
        }

        cell.parkNameLabel?.text = park.fullName
        cell.parkTypeLabel?.text = park.designation
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parks.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected = indexPath.row
        self.performSegue(withIdentifier: "viewDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewDetail" {
            let vc = segue.destination as! DetailViewController
            let park = parks[rowSelected]
            vc.parkName = park.fullName
            vc.parkType = park.designation
            vc.parkImageURL = !park.images.isEmpty ? park.images[0].url : nil
            vc.parkDescription = park.description
        }
    }
        
    func configureRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }

    @objc func handleRefreshControl() {
//        fetchParkData()
        readParkData()
        
        DispatchQueue.main.async {
            self.refreshControl?.endRefreshing()
        }
    }
}
