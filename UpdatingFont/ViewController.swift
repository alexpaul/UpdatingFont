//
//  ViewController.swift
//  UpdatingFont
//
//  Created by Alex Paul on 11/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var tableView: UITableView!
  
  var languages = ["Java", "C", "PHP", "Swift", "Kotlin", "Objective C"]
  
  var fontSize: Float = 17 {
    didSet {
      tableView.reloadData()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let settingsViewController = segue.destination as? SettingsViewController else {
      fatalError("could not cast to SettingsViewController")
    }
    settingsViewController.defaultFontSize = fontSize
  }

  @IBAction func updateFont(segue: UIStoryboardSegue) {
    guard let settingsViewController = segue.source as? SettingsViewController else {
      fatalError("could't cast to SettingsViewController")
    }
    fontSize = settingsViewController.defaultFontSize
  }
  
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return languages.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath)
    let language = languages[indexPath.row]
    cell.textLabel?.text = language
    cell.textLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
    return cell
  }
}
