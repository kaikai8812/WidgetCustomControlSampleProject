//
//  CustomControlControl.swift
//  CustomControl
//
//  Created by aoyamakai on 2024/08/04.
//

import AppIntents
import SwiftUI
import WidgetKit

// コントロールウィジェットの構成は、ControlWidgetに準拠した構造体で行う
struct CustomControlControl: ControlWidget {
    static let kind: String = "kaikai.WidgetCustomControlSampleProject.CustomControl"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: Self.kind,
            provider: Provider(),
            content: { value in
                ControlWidgetToggle(
                    "Start Timer",
                    isOn: value,
                    action: StartTimerIntent(),
                    valueLabel: { isOn in
                        Label(
                            isOn ? "On" : "Off",
                            systemImage: isOn ? "cloud.bolt.fill" :  "square.and.arrow.up"
                        )
                    }
                )
            }
        )
        .displayName("kaikaiWidget")
        .description("kaikaiのwidgetだよ")
    }
}

extension CustomControlControl {
    struct Provider: ControlValueProvider {
        var previewValue: Bool {
            true
        }

        func currentValue() async throws -> Bool {
            let isOn = false // Check if the timer is running
            return isOn
        }
    }
}

/// AppIntent
struct StartTimerIntent: SetValueIntent {
    static var title: LocalizedStringResource { "Start a timer" }

    @Parameter(title: "Timer is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        // Start / stop the timer based on `value`.
        return .result()
    }
}
