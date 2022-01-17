import ui
import gx

const (
	win_width  = 250
	win_height = 250
)

struct App {
mut:
	window &ui.Window = 0
}

fn dd_change(mut app App, dd &ui.Dropdown) {
	println(dd.selected().text)
}

fn main() {
	mut app := &App{}
	window := ui.window(
		width: win_width
		height: win_height
		title: 'App Title'
		resizable: true
		state: app
		children: [
						ui.column(
				margin: ui.Margin{5, 5, 5, 5}
				children: [
					ui.dropdown(
						width: 140
						def_text: 'Select a Blockchain'
						on_selection_changed: dd_change
												items: [
							ui.DropdownItem{
								text: 'Binance'
							},
							ui.DropdownItem{
								text: 'Cardano'
							},
							ui.DropdownItem{
								text: 'Ethereum'
							},
														ui.DropdownItem{
								text: 'Fantom'
							},
														ui.DropdownItem{
								text: 'Harmony'
							},
														ui.DropdownItem{
								text: 'Huobi'
							},
														ui.DropdownItem{
								text: 'Polygon'
							},
														ui.DropdownItem{
								text: 'Solana'
							},
														ui.DropdownItem{
								text: 'xDai'
							},
						]
					),
				]
			),
			ui.row(
				margin_: .3
				widths: .4
				heights: .4
				bg_color: gx.rgba(255, 0, 0, 20)
				children: [
					ui.button(text: 'Add'),
				]
			),
		]
	)
	app.window = window
	ui.run(window)
}