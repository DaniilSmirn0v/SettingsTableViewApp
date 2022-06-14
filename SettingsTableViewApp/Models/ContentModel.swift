//
//  ContentModel.swift
//  SettingsTableViewApp
//
//  Created by Даниил Смирнов on 30.05.2022.
//

import Foundation

struct ContentModel {
    var title: String
    var subTitle: String?
    var image: String?
    var type: contentType
    var hasBadge: Bool?
    
    static var sections: [String] {
        return ["firstBlock", "secondBlock", "thirdBlock"]
    }
    
    static var rowsInSection: [String:[ContentModel]] {
        return [
            "firstBlock": [
                ContentModel(title: "Авиарежим", subTitle: nil, image: "airplane", type: .imageTitleSwitcher, hasBadge: false),
                ContentModel(title: "Wi-Fi", subTitle: "Не подключено", image: "wifi.square.fill", type: .imageTitleSubTitle, hasBadge: false),
                ContentModel(title: "Bluetooth", subTitle: "Вкл.", image: "b.square", type: .imageTitleSubTitle, hasBadge: false),
                ContentModel(title: "Сотова связь", subTitle: nil, image: "antenna.radiowaves.left.and.right", type: .defaultCell, hasBadge: false),
                ContentModel(title: "Режим модема", subTitle: nil, image: "personalhotspot", type: .defaultCell, hasBadge: false),
                ContentModel(title: "VPN", subTitle: "Не подключено", image: "abc", type: .imageTitleSwitcher, hasBadge: false)
            ],
            "secondBlock": [
                ContentModel(title: "Уведломления", subTitle: nil, image: "bell.badge", type: .withBadge, hasBadge: true),
                ContentModel(title: "Звуки, тактильные сигналы", subTitle: nil, image: "speaker.wave.3.fill", type: .defaultCell, hasBadge: false),
                ContentModel(title: "Фокусирование", subTitle: nil, image: "moon.fill", type: .defaultCell, hasBadge: false),
                ContentModel(title: "Экранное время", subTitle: nil, image: "hourglass", type: .defaultCell, hasBadge: false)
            ],
            "thirdBlock": [
                ContentModel(title: "Основные", subTitle: nil, image: "gear", type: .withBadge, hasBadge: true),
                ContentModel(title: "Пункт управления", subTitle: nil, image: "squareshape.controlhandles.on.squareshape.controlhandles", type: .defaultCell, hasBadge: false),
                ContentModel(title: "Экран и яркость", subTitle: nil, image: "aqi.medium", type: .defaultCell, hasBadge: false),
                ContentModel(title: "Экран \"домой\"", subTitle: nil, image: "homekit", type: .defaultCell, hasBadge: false),
                ContentModel(title: "Универсальный доступ", subTitle: nil, image: "figure.wave.circle", type: .defaultCell, hasBadge: false),
                ContentModel(title: "Обои", subTitle: nil, image: "globe", type: .defaultCell, hasBadge: false),
                ContentModel(title: "Siri и Поиск", subTitle: nil, image: "rotate.3d", type: .defaultCell, hasBadge: false),
                ContentModel(title: "Face ID и код-пароль", subTitle: nil, image: "faceid", type: .defaultCell, hasBadge: false),
                ContentModel(title: "Экстренный вызов - SOS", subTitle: nil, image: "abc", type: .defaultCell, hasBadge: false),
                ContentModel(title: "Уведомления о контакте", subTitle: nil, image: "record.circle.fill", type: .defaultCell, hasBadge: false),
                ContentModel(title: "Аккумулятор", subTitle: nil, image: "battery.100", type: .defaultCell, hasBadge: false),
                ContentModel(title: "Конфиденциальность", subTitle: nil, image: "hand.raised.fill", type: .defaultCell, hasBadge: false)
            ]
            ]
    }
    
    static func getRowsIn(section: Int) -> [ContentModel] {
        let sec = ContentModel.sections[section]
                if let arr = ContentModel.rowsInSection[sec] {
                    return arr
                }
                return []
    }
    
    enum contentType {
        case imageTitleSwitcher
        case imageTitleSubTitle
        case withBadge
        case defaultCell
    }
    
}
