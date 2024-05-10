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
    
    var selectedExerciseLabel: String?
    var selectedExerciseNumber: String?
    var selectedExercise: Exercises?
    
    var ffmodel : FFModel!
    var isCameraAccessAllowed = false
    let ExercisesInstance : [Exercises] = ExerciseManager.getExercise()
    var speechSynthesizer = AVSpeechSynthesizer()
    let speechSynthesizerQueue = DispatchQueue(label: "com.faceflex.speechsynthesizer")
    
    @IBOutlet weak var videoPlayerView: UIView!
    var player: AVPlayer?
       var playerLayer: AVPlayerLayer?

    
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var cameraView: UIView!
    var captureSession = AVCaptureSession()
    var sessionOutput =  AVCapturePhotoOutput()
    var previewLayer =  AVCaptureVideoPreviewLayer()
    var isNotWorking: Bool = false
    var frameCount: Int = 0
    var workingTimeStart: Date?
    let workingTimeThreshold: TimeInterval = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Pucker Up"
        
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
        
        
        
        do {
            ffmodel = try FFModel(configuration: MLModelConfiguration())
        } catch {
            print("Error Configuring ML Model! \(error)")
        }
        configureCamera()
        pauseVideo()
        speechSynthesizer.delegate = self
        
//        if let exerciseNumber = selectedExerciseNumber {
//                   // Find the corresponding exercise in ExercisesInfo
//                   selectedExercise = ExerciseManager.ExercisesInfo.first(where: { $0.exerciseNumber == exerciseNumber })
//                   // Populate UI elements with exercise data
//                   if let exercise = selectedExercise {
//                       exerciseNumberLabel.text = exercise.exerciseNumber
//                       exerciseImageView.image = UIImage(named: exercise.exerciseImage)
//                       exerciseHeadingLabel.text = exercise.exerciseHeadingText
//                       exerciseDescriptionLabel.text = exercise.exerciseDescriptionText
//                   }
//               }
        
        
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
        if let voice = AVSpeechSynthesisVoice(identifier: "com.apple.tts.voice.samantha") {
        speechUtterance.voice = voice
       } else {
            print("Female voice not available")
        }
        speechUtterance.rate = 0.6 // More natural speech rate
        self.speechSynthesizer.speak(speechUtterance)
   }




    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showAlert(title: "Ready to Start?", message: "Are you ready to start the workout?")
        startCameraSession()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopCameraSession()
    }
    
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
                                        print("this thing is working??")
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
            captureSession.startRunning()
        }
        
        func startCameraSession() {
            // Start the camera session only if camera access is allowed
            guard isCameraAccessAllowed else { return }
            guard !captureSession.isRunning else { return } // Check if session is already running
            
            captureSession.startRunning()
        }
        
        
        
        func stopCameraSession() {
            // Stop the camera session if it's running
            if captureSession.isRunning {
                captureSession.stopRunning()
            }
        }
    

    
    
    @IBAction func doneTapped(_ sender: Any) {
        let exercise =
//        print(exercise)
        ExerciseManager.markExerciseCompleted(name: "Air Puff Exercise")
    }
    
    
    
    
    
    
    
    
    
    
    
    
 

        
        
    }











//    func configureCamera() {
//            do{
//                ffmodel = try FFModel(configuration: MLModelConfiguration())
//                do {
//                    ffmodel = try FFModel(configuration: MLModelConfiguration())
//                } catch {
//                    print("Error initializingFF Model \(error)")
//                }
//            } catch{
//                print("Error initializing FF Model \(error)")
//            }
//
//            // Setup camera session for drowsiness detection
//            captureSession = AVCaptureSession()
////            guard let captureSession1 = captureSession  else {
////                print("Failed to create AVCaptureSession")
////                return
////            }
//
//            guard let frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else {
//                print("Failed to get the front camera device")
//                return
//            }
//
//            do {
//                let input = try AVCaptureDeviceInput(device: frontCamera)
//                captureSession.addInput(input)
//            } catch {
//                print("Error configuring camera input: \(error)")
//                return
//            }
//
//            let output = AVCaptureVideoDataOutput()
//            output.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_32BGRA)]
//            output.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
//
//            captureSession.addOutput(output)
//            captureSession.startRunning()
//        }
    


//    func showAlertt(title: String, message: String) {
//        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
//            // Resume video playback when the user taps "OK"
//            self.player?.play()
//        }))
//
//        // Pause video playback when the warning alert is displayed
//        player?.pause()
//
//        present(alertController, animated: true, completion: nil)
//    }
        
        
//        func showAlert(title: String, message: String) {
//            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            present(alertController, animated: true, completion: nil)
//        }


//    func speakText(_ text: String) {
//           // Speak the provided text
//        let speechUtterance = AVSpeechUtterance(string: text)
//            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US") // Set language to English
//            speechUtterance.voice = AVSpeechSynthesisVoice(identifier: AVSpeechSynthesisVoiceIdentifierAlex) // Female voice
//            speechUtterance.rate = 0.5 // Set speech rate to slower
//            speechSynthesizer.speak(speechUtterance)
//       }
        //    var captureSession = AVCaptureSession()
        //      var sessionOutput = AVCapturePhotoOutput()
        //      var previewLayer = AVCaptureVideoPreviewLayer()
        //
        //
        //        var isNotWorking: Bool = false
        //        var frameCount: Int = 0
        //        var workingTimeStart: Date?
        //        let workingTimeThreshold: TimeInterval = 4.0
        //
        ////      var noObjectTimer: Timer?
        ////      let noObjectDetectionThreshold = 3.0 // Threshold for consecutive "NoObject" detections
        ////      var consecutiveNoObjectCount = 0
        ////      var frameCount = 0
        //
        //      override func viewDidLoad() {
        //          super.viewDidLoad()
        //
        //          do {
        //              ffmodel = try FFModel(configuration: MLModelConfiguration())
        //          } catch {
        //              print("Error Configuring ML Model! \(error)")
        //          }
        //          configureCamera()
        //      }
        //
        //      override func viewWillAppear(_ animated: Bool) {
        //          super.viewWillAppear(animated)
        //          startCameraSession()
        //      }
        //
        //      override func viewWillDisappear(_ animated: Bool) {
        //          super.viewWillDisappear(animated)
        //          stopCameraSession()
        //      }
        //
        //    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        //        frameCount += 1
        //
        //
        //        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
        //            return
        //        }
        //
        //        do {
        //            let input1 = FFModelInput(image: pixelBuffer)
        //            let prediction = try ffmodel.prediction(input: input1)
        //            let outputString = prediction.target
        //
        //
        //            if outputString == "Object"
        //            {
        //                do
        //                {
        //                    let input = FFModelInput(image: pixelBuffer)
        //                    let prediction = try ffmodel.prediction(input: input)
        //                                     let outputString = prediction.target
        //
        //                                     // Handle the prediction results as needed
        //                                     print("Output String: \(outputString)")
        //                    if outputString == "NoObject"
        //                    {
        //                        if isNotWorking
        //                        {
        //                            // not working detected
        //                            if let startTime = workingTimeStart
        //                            {
        //                                let finishTime = Date().timeIntervalSince(startTime)
        //                                if finishTime >= workingTimeThreshold
        //                                {
        //                                    DispatchQueue.main.async{
        //                                        showAlert(title: "Alert", message: "Please move , you are not doing anything")
        //                                    }
        //                                }
        //
        //                            }
        //                            else
        //                            {
        //                                //starts tracking no work
        //                                workingTimeStart = Date()
        //                            }
        //                        }
        //                        else{
        //                            isNotWorking = true
        //                            workingTimeStart = Date()
        //
        //                        }
        //                    }
        //                    else
        //                    {
        //                        //reset no hand detection
        //                        isNotWorking = false
        //                        workingTimeStart = nil
        //                    }
        //                }
        //                catch
        //                {
        //                    print("Error making predictions: /(error)")
        //                }
        //    }
        //
        //    }
        //
        //
        //
        ////      @objc func handleNoObjectDetection() {
        ////          showAlert(title: "Alert", message: "You are not doing exercise!")
        ////          // Reset consecutive no object count and invalidate the timer
        //////          consecutiveNoObjectCount = 0
        //////          noObjectTimer?.invalidate()
        //////          noObjectTimer = nil
        ////      }
        //
        //      func configureCamera() {
        //          AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
        //              guard let self = self else { return }
        //              if granted {
        //                  self.isCameraAccessAllowed = true
        //                  DispatchQueue.main.async {
        //                      self.setupCameraSession()
        //                  }
        //              } else {
        //                  self.isCameraAccessAllowed = false
        //                  DispatchQueue.main.async {
        //                      // Present an alert or navigate to a screen explaining the need for camera access
        //                      self.showAlert(title: "Camera Access Denied", message: "Please grant access to the camera in Settings to use this feature.")
        //                  }
        //              }
        //          }
        //      }
        //
        //      func setupCameraSession() {
        //          // Configure the camera session only if camera access is allowed
        //          guard isCameraAccessAllowed else { return }
        //
        //          // Your existing camera setup code
        //          guard let frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else { return }
        //
        //          do {
        //              let input = try AVCaptureDeviceInput(device: frontCamera)
        //              captureSession.addInput(input)
        //          } catch {
        //              print("Error configuring camera: \(error)")
        //              return
        //          }
        //
        //          let output = AVCaptureVideoDataOutput()
        //          output.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_32BGRA)]
        //          output.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        //
        //          captureSession.addOutput(output)
        //
        //          previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        //          previewLayer.videoGravity = .resizeAspectFill
        //          previewLayer.connection?.videoOrientation = .portrait
        //          previewLayer.frame = cameraView.bounds
        //          cameraView.layer.addSublayer(previewLayer)
        //          captureSession.startRunning()
        //      }
        //
        //      func startCameraSession() {
        //          // Start the camera session only if camera access is allowed
        //          guard isCameraAccessAllowed else { return }
        //          guard !captureSession.isRunning else { return } // Check if session is already running
        //
        //          captureSession.startRunning()
        //      }
        //
        //      func stopCameraSession() {
        //          // Stop the camera session if it's running
        //          if captureSession.isRunning {
        //              captureSession.stopRunning()
        //          }
        //      }
        //
        //      func showAlert(title: String, message: String) {
        //          let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //          alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        //          present(alertController, animated: true, completion: nil)
        //      }
        //  }
    
