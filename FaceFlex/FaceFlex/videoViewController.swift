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
    
    
    
    var player: AVPlayer?
       var playerLayer: AVPlayerLayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
