//
//  FormProfileCell.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 31.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit


class FormProfileCell : UITableViewCell {
  
  static let cellId = "FormProfileCell"
  
  private var model : EditProfileFormModel?
  
  // MARK: - Views
  private var formLabel: UILabel = {
    let label = UILabel()
    label.textColor     = .label
    label.numberOfLines = 0
    return label
  }()
  
  private var textField: UITextField = {
    let tx = UITextField()
    tx.returnKeyType = .done
    
    return tx
  }()
  
  private lazy var stack: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [formLabel,textField])
    stack.distribution = .fill
    stack.axis         = .horizontal
    stack.spacing      = 10
    stack.alignment    = .fill
    return stack
  }()
  
  // MARK: - Clousers
  
  var didUpdateTextField :((EditProfileFormModel)-> Void)?
  
  // MARK: - Init
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    textField.delegate = self
    selectionStyle = .none
    setUpViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
// MARK: - TextField Delegate
extension FormProfileCell: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    guard var model = model else {return true}
    model.value = textField.text
    didUpdateTextField!(model)
    textField.resignFirstResponder()
    return true
  }
}

// MARK: - Set up Views
extension FormProfileCell {
  private func setUpViews() {
    
    addSubview(stack)
    stack.fillSuperview(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
    formLabel.constrainWidth(constant: contentView.width / 3)
    
  }
}

// MARK: - ConfigureCell
extension FormProfileCell {
  func configure(with model: EditProfileFormModel) {
    self.model = model
    formLabel.text       = model.label
    textField.placeholder = model.placeHolder
    textField.text        = model.value
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.model            = nil
    formLabel.text        = nil
    textField.placeholder = nil
    textField.text        = nil
  }
}
