//
//  TextFieldCell.swift
//  iOSExample
//
//  Created by Bibin Jacob Pulickal on 15/05/20.
//

import UIKit

protocol TextFieldCellDelegate: AnyObject {
    func textFieldCell(_ textFieldCell: TextFieldCell, updatedText text: String?)
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

class TextFieldCell: UITableViewCell {

    let label     = UILabel()
    let textField = UITextField()

    weak var delegate: TextFieldCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(label)
        addSubview(textField)

        textField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 100)])

        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textField.centerYAnchor.constraint(equalTo: centerYAnchor)])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func handleTextChange() {
        delegate?.textFieldCell(self, updatedText: textField.text)
    }
}
