//
//  videoViewController.swift
//  FaceFlex
//
//  Created by student on 10/05/24.
//

import UIKit
import AVFoundation
class videoViewController: UIViewController {
    
    @IBOutlet var videoView: UIView!
    
    var video: String?
    @IBOutlet weak var playPauseBttn: UIButton!
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateContent()
        // Do any additional setup after loading the view.
        guard let videoURL = Bundle.main.url(forResource: "videoo", withExtension: "mp4") else {
            print("Video file not found")
            return
        }
        print("Video URL: \(videoURL)")
        // Create an AVPlayer instance
        player = AVPlayer(url: videoURL)
        
        // Create an AVPlayerLayer instance and add it to the videoPlayerView
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = videoView.bounds
        playerLayer?.videoGravity = .resizeAspectFill
        videoView.layer.addSublayer(playerLayer!)
        
        // Start playing the video
        player?.play()
        
       
    }
    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        if let player = player {
            if player.rate != 0 && player.error == nil {
                // Video is playing, pause it
                player.pause()
                sender.setTitle("Play", for: .normal)
            } else {
                // Video is paused, play it
                player.play()
                sender.setTitle("Pause", for: .normal)
            }
        }
        
       
        
    }
    let videoNames = ["video2.mp4","videoo.mp4","video2.mp4","video2.mp4","video2.mp4"]
    
    
    func updateContent() {
            // Check if the video property is set
            guard let videoName = video else {
                print("No video specified")
                return
            }
            
            // Check if the specified video exists in the videoNames array
            guard videoNames.contains(videoName) else {
                print("Specified video does not exist")
                return
            }
            
        }
        
    }

