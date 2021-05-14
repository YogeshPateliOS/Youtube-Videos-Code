//
//  ViewController.swift
//  ColorPicker_Youtube
//
//  Created by Yogesh Patel on 11/05/21.
//

import UIKit

class ViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnPickBackgroundColorTapped(_ sender: UIButton) {
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        colorPicker.supportsAlpha = false
        colorPicker.selectedColor = view.backgroundColor ?? .black
        present(colorPicker, animated: true)
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController){
        let color = viewController.selectedColor
        view.backgroundColor = color
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        view.backgroundColor = color
    }
    
}

