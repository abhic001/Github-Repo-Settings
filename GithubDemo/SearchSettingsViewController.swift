//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Abhijeet Chakrabarti on 3/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

protocol SearchSettingsViewControllerDelegate: class {
    func didSaveSettings(_ settings: GithubRepoSearchSettings)
    func didCancelSettings()
}

class SearchSettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var settings: GithubRepoSearchSettings?
    weak var delegate: SearchSettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSlider(_ sender: Any) {
        let slider = sender as! UISlider
        settings!.minStars = Int(slider.value * 100000.0)
        let cell = slider.superview!.superview as! StarCell
        cell.starLabel.text = "\(settings!.minStars)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StarCell") as! StarCell
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.delegate?.didCancelSettings()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onDone(_ sender: Any) {
        self.delegate?.didSaveSettings(settings!)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
