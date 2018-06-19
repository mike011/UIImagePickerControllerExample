//
//  ViewController.swift
//  UIImagePickerControllerExample
//
//  Created by Michael Charland on 2018-06-18.
//  Copyright © 2018 charland. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var flashModeButton: UIButton!

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func takePhoto(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.camera
        let flashMode = getFlashMode()
        picker.cameraFlashMode = flashMode

        self.present(picker, animated: true, completion: nil)
    }

    @IBAction func setTextForFlashModeButton(_ sender: UIButton) {
        if sender.titleLabel?.text == "Auto" {
            sender.setTitle("On", for: .normal)
        } else if sender.titleLabel?.text == "On" {
            sender.setTitle("Off", for: .normal)
        } else {
            sender.setTitle("Auto", for: .normal)
        }
        self.viewDidLoad()
    }
    func getFlashMode() -> UIImagePickerControllerCameraFlashMode {
        if flashModeButton.titleLabel?.text == "Auto" {
            return UIImagePickerControllerCameraFlashMode.auto
        } else if flashModeButton.titleLabel?.text == "On" {
            return UIImagePickerControllerCameraFlashMode.on
        }
        return UIImagePickerControllerCameraFlashMode.off
    }

    @IBAction func selectPhoto(_ sender: Any) {
        let library = UIImagePickerController()
        library.delegate = self
        library.allowsEditing = true
        library.sourceType = UIImagePickerControllerSourceType.photoLibrary

        self.present(library, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

