package main

import "github.com/zserge/webview"

func main() {
	// Webview options:
	//  - name: Yandex.Radio Desktop
	name := "Yandex.Radio Desktop"
	//  - URL to login screen: https://passport.yandex.ru/auth?...
	url := "https://passport.yandex.ru/auth?origin=radio&retpath=https%3A%2F%2Fradio.yandex.ru"
	//  - sizes: 800x800 px
	width := 800
	height := 800
	//  - resizable: true
	resizable := true

	// Let's open window app with options:
	webview.Open(name, url, width, height, resizable)
}
