.PHONY: run

run:
	go run ./main.go
	@echo "[✔️] App is running!"

build-macos:
	rm -rf ./build \
	&& mkdir -p ./build/macOS/Yandex.Radio\ Desktop.app/Contents/ \
	&& cp -R ./configs/macOS/Info.plist ./build/macOS/Yandex.Radio\ Desktop.app/Contents/Info.plist \
	&& mkdir -p ./build/macOS/Yandex.Radio\ Desktop.app/Contents/Resources/ \
	&& cp -R ./static/macOS/yaradio_desktop.icns ./build/macOS/Yandex.Radio\ Desktop.app/Contents/Resources/yaradio_desktop.icns \
	&& GOOS=darwin GOARCH=amd64 go build -o ./build/macOS/Yandex.Radio\ Desktop.app/Contents/MacOS/yaradio_desktop
	@echo "[✔️] Build for macOS complete!"

build-windows:
	rm -rf ./build/Windows/ \
	&& mkdir -p ./build/Windows/ \
	&& xgo -out ./build/Windows/yaradio_desktop -ldflags="-H windowsgui" --targets=windows-10/amd64 \
	github.com/koddr/yandex-radio-desktop \
	&& mv ./build/Windows/yaradio_desktop-windows-10-amd64.exe ./build/Windows/Yandex.Radio\ Desktop.exe
	@echo "[✔️] Build for MS Windows 10 x64 complete!"

installer-macos:
	rm -rf ./releases/macOS/ \
	&& mkdir -p ./releases/macOS/ \
	&& appdmg ./configs/macOS/appdmg.config.json ./releases/macOS/yaradio_desktop-macosx-amd64.dmg
	@echo "[✔️] macOS 10.11+ installer created!"

archive-zip-windows:
	rm -rf ./releases/Windows/ \
	&& mkdir -p ./releases/Windows/ \
	&& cd ./build/Windows \
	&& zip ../../releases/Windows/yaradio_desktop-windows-10-amd64.zip ./Yandex.Radio\ Desktop.exe
	@echo "[✔️] MS Windows 10 zip-archive created!"
