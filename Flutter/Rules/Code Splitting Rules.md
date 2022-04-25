## Code Splitting Rules (Refactoring) / 작성 중
HTML & CSS & JS를 공부하다가 React를 처음 개발했을 때 개인적으로 가장 맘에 들었던 부분은 페이지 내 View들을 별도의 소스파일로 나누어 `Component` 단위로 관리 할 수 있다는 점이었습니다. <br>
<div align="center">
<img width="248" alt="folder" src="https://user-images.githubusercontent.com/75591730/165092811-14c91e1a-2955-4615-a75f-e769033e1e05.png">
</div>
예전에 인턴을 할 때 React Native로 했을 때 구성한 소스파일들 입니다. <br> 너무 변태적으로 쪼갠다라는 이야기도 듣기도 하지만 저는 코드를 이런 리팩토링 방식을 선호합니다.<br>

<br/>
<div align="center">
<img width="400" src="https://user-images.githubusercontent.com/75591730/165095075-aa948a61-9bc0-400a-b5ec-413db0109cd8.png"/>
</div>

`Flutter`에서도 마찬가지로 Widget 단위로 코드를 분할하여 작성하는 편 입니다. <br>
그럼 코드를 분할에서 얻는 이점이 무엇인지 그리고 어떻게 코드를 분할하는 방식에 대해서 이야기 해보죠. <br>
참고로 소개하려고 하는 방식은 절대 `BestPractice(모범 사례)`가 아닙니다.  분명 더 좋은 리팩토링 규칙이 존재할 것 같다는 생각이 듭니다.
<br>
___
## 분할 방식
<img src="https://user-images.githubusercontent.com/75591730/165103757-9ef6e061-d27d-4185-aba2-a4b77cb3fc7f.png">





___ 

## 폴더 구조
다음 폴더 구조부터 살펴보겠습니다.
- lib
  - `screens`
    - `home`
      - home_screen.dart 
      - localWidget
        - alert_dialog.dart
        - sticky_swiper.dart
  - `widgets` 
    - content_list_view.dart
    - some_widget.dart
  
### screen
`screen` 폴더에서 어플리케이션에서 사용되는 스크린 소스들을 관리합니다. 

### home
스크린에 해당되는 섹션으로 폴더명을 짓습니다. 해당 폴더에서는 스크린 소스파일(home_screen.dart)과 `localWidget`폴더를 담고 있습니다.

### localWidget
해당 스크린 섹션에서만 사용되는 위젯들을 관리합니다. 
    








