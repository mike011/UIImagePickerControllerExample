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
    
    var camera: UIImagePickerController! = nil
    
    func getCamera() -> UIImagePickerController {
        if camera == nil {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = UIImagePickerControllerSourceType.camera
            camera = picker
        }
        let flashMode = getFlashMode()
        camera.cameraFlashMode = flashMode
        return camera
    }
    
    @IBAction func takePhoto(_ sender: Any) {

        self.present(getCamera(), animated: true, completion: nil)
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
        let camera = getCamera()
        camera.view.frame = CGRect(x: 0, y: 0, width: imageView.bounds.width, height: imageView.bounds.height)
        
        //camera.view.addLayoutGuide(imageView.layoutGuides[0])
        //let translate = CGAffineTransform(translationX: 0.0, y: 0)
        //let scale = translate.scaledBy(x:0.5, y: 0.5)
        //camera.cameraViewTransform = scale
        imageView.addSubview(camera.view)
        // Do any additional setup after loading the view, typically from a nib.
    }
}

