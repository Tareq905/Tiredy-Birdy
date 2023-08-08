//
//  BirdsDetailsViewController.swift
//  Tiredy-Birdy
//
//  Created by Kobiraj on 8/9/21.
//

import UIKit

protocol BirdsPetNameUpdate {
    func petNameUpdater(birdName: String, newPetName: String)
}

class BirdsDetailsViewController: UIViewController {

    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var birdsImage: UIImageView!
    @IBOutlet weak var birdsName: UITextView!
    @IBOutlet weak var birdsColor: UITextView!
    @IBOutlet weak var birdsPetName: UITextView!
    var petNameUpdateDelegate : BirdsPetNameUpdate?
    var tempTitleName = ""
    var tempBirdsImage = ""
    var tempBirdsName = ""
    var tempBirdsColor = ""
    var tempBirdsPetName = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        titleName.text = tempTitleName
        birdsImage.image = UIImage(named: tempBirdsImage)
        birdsName.text = tempBirdsName
        birdsColor.text = tempBirdsColor
        birdsPetName.text = tempBirdsPetName
        // Do any additional setup after loading the view.
    }
    @IBAction func OkButtonPressed(_ sender: UIButton) {
        petNameUpdateDelegate?.petNameUpdater(birdName: tempBirdsName, newPetName: birdsPetName.text)
        self.dismiss(animated: true, completion: nil)
    }

}
