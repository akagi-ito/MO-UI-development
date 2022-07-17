/****************************************************************************
**
** Copyright (C) 2014 Alexander Rössler
** License: LGPL version 2.1
**
** This file is part of QtQuickVcp.
**
** All rights reserved. This program and the accompanying materials
** are made available under the terms of the GNU Lesser General Public License
** (LGPL) version 2.1 which accompanies this distribution, and is available at
** http://www.gnu.org/licenses/lgpl-2.1.html
**
** This library is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
** Lesser General Public License for more details.
**
** Contributors:
** Alexander Rössler @ The Cool Tool GmbH <mail DOT aroessler AT gmail DOT com>
**
****************************************************************************/

import QtQuick 2.0
 
Rectangle {
    id: splash
    z: 100
    property alias loadingProgress: progressRect.percent
    readonly property int smallerSide: width < height ? width : height

    color: "#008080"

    Image {
        source: "images/cpsLogo.png"
        fillMode: Image.Tile
        sourceSize.width: parent.smallerSide * 0.3
        anchors.fill: parent
        smooth: true
        visible: true
        opacity: 0.1
    }

    Image {
        id: logoImg
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.smallerSide*0.08
        source: "images/logo_text.png"
        smooth: true
        width: parent.smallerSide*0.55
        height: width
        sourceSize.width: width
        sourceSize.height: height
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id:  barRect
        anchors.top: logoImg.bottom
        anchors.topMargin: parent.smallerSide*0.04
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.smallerSide*0.6
        height: parent.smallerSide*0.015
        smooth: true
        border.color: "white"; border.width: 0; radius: 8
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#66343434" }
            GradientStop { position: 1.0; color: "#66000000" }
        }
        
        Rectangle {
            id: progressRect
            property real percent: 0.5
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.01
            width: parent.width*0.98*percent
            height: parent.height*0.8
            smooth: true
            border.color: "#FFD75E"; border.width: 0; radius: 8
            color: "#FFD75E"
        }
    }

    Behavior on opacity { NumberAnimation { duration: 200 } }
} 
