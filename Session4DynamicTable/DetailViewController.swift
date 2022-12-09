//
//  DetailViewController.swift
//  Session4DynamicTable
//
//  Created by Ali Akbar on 09/12/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var academyImage: UIImageView!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var academyModel: AcademyModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let result = academyModel {
            academyImage.image = result.image
            nameLabel.text = result.name
            descLabel.text = result.description
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
