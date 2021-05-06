//
//  ViewController.swift
//  BaseVC_Youtube
//
//  Created by Yogesh Patel on 06/05/21.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnSelectPhotoTapped(_ sender: Any) {
        self.present(super.showImagePicker(sourceType: .photoLibrary), animated: true)
        super.imgBlock = { selectedImg in
            self.img.image = selectedImg
        }
    }
    
}






















