#!make

help:
	@echo "Usage: make [ ... ]"
	@echo ""
	@echo "Usage:"
	@echo "  make setup"
	@echo "  make quality"
	@echo "  make test"
	@echo "  make debug_wifi"
	@echo ""

setup:
	flutter clean
	flutter pub get


quality:
	dart fix --apply
	dart format .
	flutter analyze .

tests:
	flutter test --coverage

debug-wifi:
	adb devices
	adb tcpip 5555
	adb connect 000.000.0.000:5555
