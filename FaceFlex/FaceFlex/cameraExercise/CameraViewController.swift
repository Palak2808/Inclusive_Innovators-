////
////  cameraViewController.swift
////  Camera
////
////  Created by Utsav  on 28/04/24.
////
//
import UIKit
import  AVFoundation
import CoreML

class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate, AVSpeechSynthesizerDelegate {
    
    var selectedExerciseLabel: String? // Label for the selected exercise
        var selectedExerciseNumber: String? // Number for the selected exercise
        var selectedExercise: Exercises? // Selected exercise object
        var ffmodel: FFModel! // CoreML model for exercise detection
        var isCameraAccessAllowed = false // Flag indicating camera access permission
        var speechSynthesizer = AVSpeechSynthesizer() // Speech synthesizer for providing exercise instructions
        let speechSynthesizerQueue = DispatchQueue(label: "com.faceflex.speechsynthesizer") // Dispatch queue for speech synthesizer
    
    @IBOutlet weak var videoPlayerView: UIView! // View to display video instructions
    
    @IBOutlet weak var button: UIButton! // Button for user interaction
    @IBOutlet weak var cameraView: UIView! // View to display camera feed
    var captureSession = AVCaptureSession() // Camera capture session
        var sessionOutput = AVCapturePhotoOutput() // Session output
        var previewLayer = AVCaptureVideoPreviewLayer() // Preview layer for camera feed
        var player: AVPlayer? // Player for video instructions
        var playerLayer: AVPlayerLayer? // Player layer for video instructions
        var isNotWorking: Bool = false // Flag indicating if the user is not performing the exercise
        var frameCount: Int = 0 // Frame count for exercise detection
        var workingTimeStart: Date? // Start time for detecting user inactivity
        let workingTimeThreshold: TimeInterval = 2.0 // Threshold for detecting user inactivity
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Pucker Up" // Set navigation title
        
        guard let videoURL = Bundle.main.url(forResource: "exerciseVideo", withExtension: "mp4") else {
                    print("Video file not found")
                    return
                }
        print("Video URL: \(videoURL)")
                // Create an AVPlayer instance
                player = AVPlayer(url: videoURL)
                
                // Create an AVPlayerLayer instance and add it to the videoPlayerView
                playerLayer = AVPlayerLayer(player: player)
                playerLayer?.frame = videoPlayerView.bounds
                playerLayer?.videoGravity = .resizeAspectFill
                videoPlayerView.layer.addSublayer(playerLayer!)
                
                // Start playing the video
                player?.play()
        
        
        // Initialize CoreML model for exercise detection
        do {
            ffmodel = try FFModel(configuration: MLModelConfiguration())
        } catch {
            print("Error Configuring ML Model! \(error)")
        }
        
        // Configure camera and video playback
        configureCamera()
        pauseVideo()
        speechSynthesizer.delegate = self
    }
    func showAlert(title: String, message: String) {
           let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
           alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
               // Resume video playback when the user taps "OK"
            
               self?.startVideo()
               self?.speakPuckerUpInstructions()
           }))
           
           // Pause video playback when the warning alert is displayed
           pauseVideo()
           
           present(alertController, animated: true, completion: nil)
       }
       
       func pauseVideo() {
           player?.pause()
       }
       
       func startVideo() {
           player?.play()
       }
    
    
        func speakPuckerUpInstructions() {
            let speechUtterance = AVSpeechUtterance(string: "For the Pucker Up exercise, puff your cheeks and hold the air for 5 seconds. Then release the air slowly. Repeat this process 10 times.")
                if let voice = AVSpeechSynthesisVoice(identifier: "com.apple.tts.voice.samantha.en-US")
                  {
                    speechUtterance.voice = voice
                    
                  } 
                else
                    {
                        print("Female voice not available")
                    }
        speechUtterance.rate = 0.4 // More natural speech rate
        self.speechSynthesizer.speak(speechUtterance)
   }




    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showAlert(title: "Ready to Start?", message: "Are you ready to start the workout?")
        startCameraSession()  // Start camera session
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopCameraSession() // Stop camera session when the view disappears
    }
    
    
    // Handle camera output and exercise detection
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        frameCount += 1
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
        
        do {
            let input1 = FFModelInput(image: pixelBuffer)
            let prediction = try ffmodel.prediction(input: input1)
            let outputString = prediction.target
            
            
            if outputString == "NoObject"
            {
                do
                {
                    let input = FFModelInput(image: pixelBuffer)
                    let prediction = try ffmodel.prediction(input: input)
                    let outputString = prediction.target
                    let outputDictionary = prediction.targetProbability
                    
                    // Handle the prediction results as needed
                    print("Output String: \(outputString)")
                    print("Output Dictionary : \(outputDictionary)")
                
                    if outputString == "NoObject"
                    {
                        if isNotWorking
                        {
                            // not working detected
                            if let startTime = workingTimeStart
                            {
                                let finishTime = Date().timeIntervalSince(startTime)
                                print("Its working")
                                if finishTime >= workingTimeThreshold
                                {
                                    print("its working too")
                                    DispatchQueue.main.async{
                                        print("this Dispatch  is working??")
                                        self.showAlert(title: "Alert", message: "Please move , you are not doing anything")
                                        self.workingTimeStart = Date()
                                    }
                                }
                                
                                
                            }
                            else
                            {
                                //starts tracking no work
                                workingTimeStart = Date()
                            }
                        }
                        else{
                            isNotWorking = true
                            workingTimeStart = Date()
                            
                        }
                    }
                    else
                    {
                        //reset no hand detection
                        isNotWorking = false
                        workingTimeStart = nil
                    }
                }
                catch
                {
                    print("Error making predictions: /(error)")
                }
                
                
            }
        }
            catch
            {
                print("Error in pixel buffer /(error) ")
            }
        }
        
        
        func configureCamera() {
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                guard let self = self else { return }
                if granted {
                    self.isCameraAccessAllowed = true
                    DispatchQueue.main.async {
                        self.setupCameraSession()
                    }
                } else {
                    self.isCameraAccessAllowed = false
                    DispatchQueue.main.async {
                        // Present an alert or navigate to a screen explaining the need for camera access
                        self.showAlert(title: "Camera Access Denied", message: "Please grant access to the camera in Settings to use this feature.")
                    }
                }
            }
        }
    
        func setupCameraSession() {
            // Configure the camera session only if camera access is allowed
            guard isCameraAccessAllowed else { return }
            
            // Your existing camera setup code
            guard let frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else { return }
            
            do {
                let input = try AVCaptureDeviceInput(device: frontCamera)
                captureSession.addInput(input)
            } catch {
                print("Error configuring camera: \(error)")
                return
            }
            
            let output = AVCaptureVideoDataOutput()
            output.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_32BGRA)]
            output.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
            
            captureSession.addOutput(output)
            
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer.videoGravity = .resizeAspectFill
            previewLayer.connection?.videoOrientation = .portrait
            previewLayer.frame = cameraView.bounds
            cameraView.layer.addSublayer(previewLayer)
//            captureSession.startRunning()
      
                   // Call startRunning() on the background queue
                   self.captureSession.startRunning()
               
        }
        
        func startCameraSession() {
            // Start the camera session only if camera access is allowed
            guard isCameraAccessAllowed else { return }
            guard !captureSession.isRunning else { return } // Check if session is already running
           
                   // Call startRunning() on the background queue
                   self.captureSession.startRunning()
               
           // captureSession.startRunning()
        }
        
        
        
        func stopCameraSession() {
            // Stop the camera session if it's running
            if captureSession.isRunning {
                captureSession.stopRunning() //stop camera session
            }
        }
    
    @IBAction func ExerciseToCameraSegue(segue: UIStoryboardSegue)  // Action for unwinding segue from exercise selection
    {
        
    }
    
    // Action for tapping the done button
    @IBAction func doneButtonTapped(_ sender: Any) {
        ExerciseManager.shared.isExerciseCompleted(name: selectedExerciseLabel ?? "Cheek Lifter")
        performSegue(withIdentifier: "unwindToSourceViewController", sender: self)
        
        
    }
    
    // Prepare for navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        ExerciseManager.shared.isExerciseCompleted(name: selectedExerciseLabel ?? "Cheek Lifter")
    }
}











