//
//  ViewController.swift
//  Tiredy-Birdy
//
//  Created by Kobiraj on 4/9/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var birdsTableView: UITableView!
    
    var dataModel = BirdsData()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.birdsTableView.register(UINib.init(nibName: dataModel.tableViewCellNibName, bundle: nil), forCellReuseIdentifier: dataModel.tableViewCellNibName)
        self.birdsTableView.delegate = self
        self.birdsTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Array(dataModel.birds.keys).count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(dataModel.birds.keys)[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(dataModel.birds.values)[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dataModel.tableViewCellNibName) as! BirdsViewCell
        let name = Array(Array(dataModel.birds.values)[indexPath.section])[indexPath.row]
        cell.BirdsImage.image = UIImage(named: name)
        cell.BirdsName.text = name
        cell.BirdsPetName.text = dataModel.petName[name]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = BirdsDetailsViewController(nibName: dataModel.BirdsDetailsViewNibName, bundle: nil)
        
        let name = Array(Array(dataModel.birds.values)[indexPath.section])[indexPath.row]
        destinationVC.tempTitleName = name
        destinationVC.tempBirdsName = name
        destinationVC.tempBirdsImage = name
        destinationVC.tempBirdsPetName = dataModel.petName[name]!
        destinationVC.tempBirdsColor = dataModel.color[name]!
        
        destinationVC.petNameUpdateDelegate = self
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true, completion: nil)
    }
}

extension ViewController: BirdsPetNameUpdate {
    func petNameUpdater(birdName: String, newPetName: String) {
        dataModel.petName[birdName] = newPetName
        birdsTableView.reloadData()
    }
}
