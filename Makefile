DATE_NOW:=`date +%Y%m%d.%H%M`
VERSION:=`cider version`
APP_NAME:=Security
PATH_APK:=`PWD`/build/app/outputs/flutter-apk
PATH_APK_GOOGLE:=$(GOOGLE_DRIVE)/Klaster-Pintar/APK

generate:
	dart run build_runner build --delete-conflicting-outputs
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

run:
	flutter build appbundle \
		--dart-define=ANDROID_CLIENT_ID="476572298943-cmi707uemfuvram7d6drm2ipropq54g9.apps.googleusercontent.com" \
		--dart-define=IOS_CLIENT_ID="476572298943-uvnhmh4ukj554tm4k08e0elh75r53pms.apps.googleusercontent.com" \
		--dart-define=ANON_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1tdnd6a2hodHJpbG9oZmFsb2NsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDM1OTc0OTEsImV4cCI6MjAxOTE3MzQ5MX0.wpKc3YFPe4VhC2_NJ5Z2lJPM02zfsUHtGAeMoX2HSbk" \
		--dart-define=URL_SUPABASE="https://mmvwzkhhtrilohfalocl.supabase.co" \
		--dart-define=WEB_CLIENT_ID="476572298943-en1anjp4ri768nve4ch7is1efoi91e5f.apps.googleusercontent.com"

apk-open: apk-dev clean apk-prod
	open $(PATH_APK_GOOGLE)/
generate-splash:
	flutter pub get && flutter pub run flutter_native_splash:create
generate-icon:
	flutter pub get && flutter pub run flutter_launcher_icons
generate-two:
	dart run build_runner build --build-filter="lib/features/posts/models/post_model.freezed.dart"
	dart run build_runner build --build-filter="lib/features/posts/models/post_model.g.dart"
generate-one:
	dart run build_runner build --build-filter="lib/features/profile/bloc/profile_bloc.freezed.dart"
generate-service:
	dart run build_runner build --build-filter="lib/src/data/sources/api_service.g.dart"
