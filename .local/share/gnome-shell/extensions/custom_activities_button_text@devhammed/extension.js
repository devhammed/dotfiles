const Main = imports.ui.main

let oldLabel
let panelActivities

function init () {
  panelActivities = Main.panel.find_child_by_name('panelActivities')
}

function enable () {
  if (!panelActivities) return
  oldLabel = panelActivities._label.text
  panelActivities._label.text = '🚀  DevHammed'
}

function disable () {
  if (!panelActivities) return
  panelActivities._label.text = oldLabel
  panelActivities = null
  customActivitiesText = null
}
