//
//  Vibration.swift
//  Group3_F2019_MAD3115_FP
//
//  Created by Sai Teja on 2019-11-17.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import UIKit
import AudioToolbox

enum Vibration {
    case error
    case success
    case warning
    case light
    case medium
    case heavy
    case selection
    case oldSchool

    func vibrate() {

      switch self {
      case .error:
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)

      case .success:
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)

      case .warning:
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)

      case .light:
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()

      case .medium:
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()

      case .heavy:
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()

      case .selection:
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()

      case .oldSchool:
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
      }

    }

}
