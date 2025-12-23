//
//  PlaybookButtonVariant.swift
//  GSKButtonCompounent
//
//  Created by Hari Krishna N on 02/12/25.
//

import Foundation

import SwiftUI
internal import Playbook

 struct PlaybookButtonScenario: ScenarioProvider {
     static func addScenarios(into playbook: Playbook) {
        playbook.addScenarios(of: "Button Types") {
            Scenario("Primary-Border", layout: .fill) {
                BaseButtonVariant(title: "GSK Primary Button", variant: .primary, size: .lg, isLoading: false, enabled: true, fullWidth: false, isTextVisible: true, href: nil, isIconVisible: false, iconLeading: false, isLineVisible: true) {
                    print("Button tapped!")
                }
            };
            Scenario("Primary-WithOut Border", layout: .fill) {
                BaseButtonVariant(title: "GSK Primary Button", variant: .primary, size: .lg, isLoading: false, enabled: true, fullWidth: false, isTextVisible: true, href: nil, isIconVisible: false, iconLeading: false, isLineVisible: false) {
                    print("Button tapped!")
                }
            };
            Scenario("Primary-IconLeading", layout: .fill) {
                BaseButtonVariant(title: "GSK Primary Button", variant: .primary, size: .lg, isLoading: false, enabled: true, fullWidth: false, isTextVisible: true, href: nil, isIconVisible: true, iconLeading: true, isLineVisible: true) {
                    print("Button tapped!")
                }
            };
            Scenario("Primary-IconTrailing", layout: .fill) {
                BaseButtonVariant(title: "GSK Primary Button", variant: .primary, size: .lg, isLoading: false, enabled: true, fullWidth: false, isTextVisible: true, href: nil, isIconVisible: true, iconLeading: false, isLineVisible: true) {
                    print("Button tapped!")
                }
            };
            Scenario("Primary-WithLoader", layout: .fill) {
                BaseButtonVariant(title: "GSK Primary Button", variant: .primary, size: .lg, isLoading: true, enabled: true, fullWidth: false, isTextVisible: true, href: nil, isIconVisible: false, iconLeading: false, isLineVisible: true) {
                    print("Button tapped!")
                }
            };
            Scenario("Primary-WithOutText", layout: .fill) {
                BaseButtonVariant(title: "GSK Primary Button", variant: .primary, size: .lg, isLoading: true, enabled: true, fullWidth: false, isTextVisible: false, href: nil, isIconVisible: false, iconLeading: false, isLineVisible: true) {
                    print("Button tapped!")
                }
            };
        }
    }
}
