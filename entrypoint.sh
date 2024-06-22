flutter clean
flutter pub get
echo 'Pub get successfully executed in mesaure_app App.'
cd packages/global && fvm flutter pub get
echo 'Pub get successfully executed in global package.'
cd .. && cd report_measure && fvm flutter pub get
echo 'Pub get successfully executed in report_measure package.'
# TODO - ENDOF PUB GET
