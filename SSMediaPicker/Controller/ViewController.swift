//
//  ViewController.swift
//  SSMediaPicker
//
//  Created by Sanjay Shah on 29/05/17.
//  Copyright © 2017 Sanjay Shah. All rights reserved.
//

//MARK: - import Statements
import UIKit
import AVKit
import AVFoundation

//MARK: - Class
class ViewController: UIViewController {

    //MARK: - Variables
    var ssMediaPickerHelper : SSMediaPickerHelper?
    var videoURL: URL!
    
    //MARK: - @IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var label: UILabel!
    
    //MARK: - Class Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Button Action
    @IBAction func buttonSelectVideo(_ sender: UIButton) {
        ssMediaPickerHelper = SSMediaPickerHelper(viewController: self, isForVideo: true, imageCallback: nil, videoCallback: { (url) in
            
            if url != nil {
                self.imageView.image = self.thumbnailForVideoAtURL(url: url!)
                self.videoURL = url!
                self.label.text = url?.absoluteString
            }
            
            self.buttonPlay.isHidden = false
        })
    }
    
    @IBAction func buttonSelectImage(_ sender: UIButton) {
        ssMediaPickerHelper = SSMediaPickerHelper(viewController: self, isForVideo: false, imageCallback: { (image) in
            
            if image != nil {
                self.imageView.image = image
            }
            self.buttonPlay.isHidden = true
        }, videoCallback: nil)
    }
    
    @IBAction func buttonPlayAction(_ sender: UIButton) {
        if videoURL != nil {
            let player = AVPlayer(url: videoURL)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true) {
                playerViewController.player?.play()
            }
        }
    }
    
    //MARK: - Thumbnail For Viedeo Method
    private func thumbnailForVideoAtURL(url: URL) -> UIImage? {
        
        let asset = AVAsset(url: url)
        let assetImageGenerator = AVAssetImageGenerator(asset: asset)
        
        var time = asset.duration
        time.value = min(time.value, 2)
        
        do {
            let imageRef = try assetImageGenerator.copyCGImage(at: time, actualTime: nil)
            return UIImage(cgImage: imageRef)
        } catch {
            print("error")
            return nil
        }
    }
}

