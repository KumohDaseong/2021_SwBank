<div align="center">
    <br/>
    <h1>Bacord_Recognition_App</h1>
    <p>App for udi barcode recognition developed by kumohdaseong Team.</p><br/>
    <img src="https://forthebadge.com/images/badges/built-with-love.svg">
    <img src="https://forthebadge.com/images/badges/fo-real.svg">
    <br/>
    <br/>
    main<br/>
    <img src="https://semaphoreci.com/api/v1/foryou8033j/kumohtime_v2/branches/master/badge.svg">
    <br/>
    <br/>
</div>

#### Development
<pre class="highlight highlight-html">
Based on <a href="">Flutter</a> with Dart Language
</pre>

#### Interface

#### Requirement
```
Flutter : 2.7.0
Image_picker: ^0.7.4
flutter_native_splash: ^1.2.3
http: ^0.13.3
rxdart: ^0.27.0
shared_preferences: 2.0.7
```

#### Build Setup
```
1. $ sudo git clone {this repo}
2. $ cd 2021_swbank/flutter_app
2. $ sudo flutter pub get
3. $ sudo flutter run lib/main.dart
```

#### Branch Management
```bash

#Branch naming rules
main
항상 보호되는 안정된 브랜치

release/1.0.0
새 버전 준비를 위한 개발 브랜치

bugfix/#1
hotfix/#1
이슈 해결을 위한 브랜치, 이슈 넘버를 기입하여 구분

feature/#notification_list
remove/#weather_header_widget
기능 추가/제거를 위한 브랜치, 기능명을 기입하여 구분

#Contribute method
1. main 브랜치는 항상 안정된 빌드이자 사용자에게 서비스중인 빌드
2. 프로젝트 관리자가 새 버전 준비시에 release 브랜치 분기
3. 개발자는 이슈, 기능에 따라 release 브랜치에서 분기하여 작업 후 release 브랜치에 Pull request
4. 버전 개발 종료시 관리자는 release 브랜치를 main 브랜치에 병합

```
