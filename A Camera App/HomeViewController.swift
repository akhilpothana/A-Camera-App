//
//  ViewController.swift
//  A Camera App
//
//  Created by Akhil Pothana on 2/18/20.
//  Copyright © 2020 AkhilPothana. All rights reserved.
//

import UIKit
import AVFoundation

final class HomeViewController: UIViewController {

    @IBOutlet private var previewView: PreviewView!

    private lazy var captureSession = AVCaptureSession()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSessionInput()
        configureSessionOutput()
        previewView.videoPreviewLayer.session = captureSession

        captureSession.startRunning()
    }

    private func configureSession() {

    }

    private func configureSessionInput() {
        captureSession.beginConfiguration()
        let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!), captureSession.canAddInput(videoDeviceInput) else {
            return
        }
        captureSession.addInput(videoDeviceInput)
    }

    private func configureSessionOutput() {
        let photoOutput = AVCapturePhotoOutput()
        guard captureSession.canAddOutput(photoOutput) else {
            return
        }
        captureSession.sessionPreset = .photo
        captureSession.addOutput(photoOutput)
        captureSession.commitConfiguration()
    }
}

class PreviewView: UIView {

    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }

    /// Convenience wrapper to get layer as its statically known type.
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
}

