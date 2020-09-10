//
//  ViewController.swift
//  iOSExample
//
//  Created by Bibin Jacob Pulickal on 15/05/20.
//

import UIKit
import BBAlert
import BBLoader

class ViewController: UITableViewController {

    var selectedTitleText: String?   = "Loading"
    var selectedMessageText: String? = "Please wait..."

    var selectedBackgroundColorIndex  = 0
    var selectedTitleTextColorIndex   = 0
    var selectedMessageTextColorIndex = 0
    var selectedIndicatorColorIndex   = 0

    override func loadView() {
        super.loadView()

        tableView = UITableView(frame: tableView.frame, style: .insetGrouped)
        tableView.register(TextFieldCell.self, forCellReuseIdentifier: TextFieldCell.identifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title                                   = "BBLoader"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem                      = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(presentLoader))
    }

    override func numberOfSections(in tableView: UITableView) -> Int { Section.allCases.count }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Section.allCases[section].rawValue.camelCaseToWords
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { section == 0 ? 2 : Color.allCases.count }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.identifier, for: indexPath) as! TextFieldCell
            let bool = indexPath.row == 0
            cell.label.text     = bool ? "Title:" : "Message:"
            cell.textField.text = bool ? selectedTitleText : selectedMessageText
            cell.delegate       = self
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath)
        cell.textLabel?.text = Color.allCases[indexPath.row].rawValue
        cell.selectionStyle = .none
        if indexPath.section == 1 {
            cell.accessoryType   = indexPath.row == selectedBackgroundColorIndex ? .checkmark : .none
        } else if indexPath.section == 2 {
            cell.accessoryType   = indexPath.row == selectedTitleTextColorIndex ? .checkmark : .none
        } else if indexPath.section == 3 {
            cell.accessoryType   = indexPath.row == selectedMessageTextColorIndex ? .checkmark : .none
        } else if indexPath.section == 4 {
            cell.accessoryType   = indexPath.row == selectedIndicatorColorIndex ? .checkmark : .none
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            selectedBackgroundColorIndex  = indexPath.row
        } else if indexPath.section == 2 {
            selectedTitleTextColorIndex   = indexPath.row
        } else if indexPath.section == 3 {
            selectedMessageTextColorIndex = indexPath.row
        } else if indexPath.section == 4 {
            selectedIndicatorColorIndex   = indexPath.row
        }
        tableView.reloadData()
    }

    @objc private func presentLoader() {
        presentBBLoader(duration: 2, setup: { loader in
            loader.title                 = self.selectedTitleText
            loader.message               = self.selectedMessageText
            loader.backgroundColor       = Color.allCases[self.selectedBackgroundColorIndex].color
            loader.titleTextColor        = Color.allCases[self.selectedTitleTextColorIndex].color
            loader.messageTextColor      = Color.allCases[self.selectedMessageTextColorIndex].color
            loader.loadingIndicatorColor = Color.allCases[self.selectedIndicatorColorIndex].color
        })
    }
}

extension ViewController: TextFieldCellDelegate {

    func textFieldCell(_ textFieldCell: TextFieldCell, updatedText text: String?) {
        if textFieldCell.label.text == "Title:" {
            selectedTitleText = text
        } else {
            selectedMessageText = text
        }
    }
}
