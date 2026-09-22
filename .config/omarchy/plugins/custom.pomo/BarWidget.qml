import QtQuick
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "custom.pomo"

  property string statusText: ""

  readonly property string formatTemplate: setting("format", "{}")
  readonly property string icon: setting("icon", "")
  readonly property string displayText: {
    if (!statusText) return ""
    var text = formatTemplate.indexOf("{}") !== -1
      ? formatTemplate.replace("{}", statusText)
      : statusText
    return icon ? (icon + " " + text) : text
  }

  FileView {
    id: statusFile
    path: "/tmp/pomo-status"
    watchChanges: true
    printErrors: false
    onLoaded: {
      root.statusText = text().trim()
    }
    onLoadFailed: {
      root.statusText = ""
    }
    onFileChanged: reload()
  }

  Timer {
    id: pollTimer
    interval: 5000
    running: true
    repeat: true
    onTriggered: {
      statusFile.reload()
    }
  }

  IpcHandler {
    target: "custom.pomo"

    function status(): string {
      return root.displayText
    }

    function refresh(): void {
      statusFile.reload()
    }

    function clear(): void {
      Quickshell.execDetached(["rm", "-f", "/tmp/pomo-status"])
      root.statusText = ""
    }
  }

  visible: displayText !== ""
  implicitWidth: visible ? button.implicitWidth : 0
  implicitHeight: visible ? button.implicitHeight : 0

  WidgetButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: root.displayText
    tooltipText: "Pomodoro"
    horizontalMargin: 8.5

    onPressed: function(btn) {
      if (btn === Qt.RightButton) {
        Quickshell.execDetached(["rm", "-f", "/tmp/pomo-status"])
        root.statusText = ""
      }
    }
  }
}
