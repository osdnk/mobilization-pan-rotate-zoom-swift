//
//  ViewController.swift
//  MobilizationPanRotateAndZoom
//
//  Created by Michał Osadnik on 03/10/2018.
//  Copyright © 2018 Michał Osadnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
    let translation = recognizer.translation(in: self.view)
    if let view = recognizer.view {
      view.center = CGPoint(x:view.center.x + translation.x,
                            y:view.center.y + translation.y)
    }
    recognizer.setTranslation(CGPoint.zero, in: self.view)
  }
  
  @IBAction func handlePinch(recognizer:UIPinchGestureRecognizer) {
    if let view = recognizer.view {
      view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
      recognizer.scale = 1
    }
  }
  
  @IBAction func handleRotate(recognizer:UIRotationGestureRecognizer ) {
    if let view = recognizer.view {
      view.transform = view.transform.rotated(by: recognizer.rotation)
      recognizer.rotation = 0
    }
  }
  
  func gestureRecognizer(_: UIGestureRecognizer,
                         shouldRecognizeSimultaneouslyWith shouldRecognizeSimultaneouslyWithGestureRecognizer:UIGestureRecognizer) -> Bool {
    return true
  }

}

