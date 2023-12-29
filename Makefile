DATE_NOW:=`date +%Y%m%d.%H%M`
VERSION:=`cider version`
APP_NAME:=Security
PATH_APK:=`PWD`/build/app/outputs/flutter-apk
PATH_APK_GOOGLE:=$(GOOGLE_DRIVE)/Klaster-Pintar/APK

generate:
	flutter pub run build_runner build --delete-conflicting-outputs
watch:
	flutter pub run build_runner watch
clean:
	flutter clean
asset-generate:
	fluttergen -c pubspec.yaml
apk-dev:
	flutter build apk \
		--split-per-abi \
		--dart-define-from-file=env-dev.json \
		--flavor=dev \
		--release \
		-v
	mv $(PATH_APK)/app-armeabi-v7a-dev-release.apk $(PATH_APK_GOOGLE)/$(APP_NAME)-v$(VERSION)-$(DATE_NOW)-dev.apk
apk-prod:
	flutter build apk \
		--split-per-abi \
		--dart-define-from-file=env-prod.json \
		--flavor=prod \
		--release \
		-v

aab:
	flutter build appbundle \
		--dart-define-from-file=env-prod.json \
		--flavor=prod \
		--release \
		-v
apk-open: apk-dev clean apk-prod
	open $(PATH_APK_GOOGLE)/
generate-splash:
	flutter pub get && flutter pub run flutter_native_splash:create
generate-icon:
	flutter pub get && flutter pub run flutter_launcher_icons
generate-two:
	dart run build_runner build --build-filter="lib/src/data/models/visitor/visitor_response.freezed.dart"
	dart run build_runner build --build-filter="lib/src/data/models/visitor/visitor_response.g.dart"
generate-one:
	dart run build_runner build --build-filter="lib/features/auth/bloc/auth_cubit.freezed.dart"
generate-service:
	dart run build_runner build --build-filter="lib/src/data/sources/api_service.g.dart"
