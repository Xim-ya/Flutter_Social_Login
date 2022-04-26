## Code Splitting Rules (Refactoring) 
HTML & CSS & JS를 공부하다가 React를 처음 접했을 때 개인적으로 가장 맘에 들었던 부분은 페이지 내 View들을 별도의 소스파일로 나누어 `Component` 단위로 관리 할 수 있다는 점이었습니다. <br>
<div align="center">
<img width="248" alt="folder" src="https://user-images.githubusercontent.com/75591730/165092811-14c91e1a-2955-4615-a75f-e769033e1e05.png">
</div>
예전에 인턴 시절 땨 React Native 작성한 소스파일들 입니다. <br> 너무 변태적으로 쪼갠다라는 이야기도 듣기도 하지만 저는 코드를 이런 리팩토링 방식을 선호합니다.<br>

<br/>
<div align="center">
<img width="400" src="https://user-images.githubusercontent.com/75591730/165095075-aa948a61-9bc0-400a-b5ec-413db0109cd8.png"/>
</div>

`Flutter`에서도 마찬가지로 Widget 단위로 코드를 분할하여 작성하는 편 입니다. Flutter는 Tree구조로 구성되어 있기 때문에 적절히 코드를 분리해주지 않으면 굉장히 보기 힘든 스파게티 코드가 됩니다🤮 <br>     
그럼 어떻게 코드를 분할하는지 그리고 코드를 분할에서 얻는 이점이 무엇인지 알아봅시다 <br>
참고로 소개하려고 하는 방식은 절대 `BestPractice(모범 사례)`가 아닙니다.  분명 더 좋은 리팩토링 규칙이 존재할 것 같다는 생각이 듭니다.
<br>
___
## 접근 방식
<div align="center">
<img src="https://user-images.githubusercontent.com/75591730/165191210-d6376180-d7a1-4272-a772-cbeac6b72220.png">
</div>

일단 위 디자인을 예시로 분석해봅시다.

#### `1. 섹션 분리`

일단 저는 하나의 스크린에서 UI 위젯의 `역할`과 `레이아웃(행&열)`에 따라 크게 3개의 섹션으로 분리합니다. <br>
- 1번 섹션 : 컨텐츠 카테고리 선택 
- 2번 섹션 : 컨텐츠 정보를 보여주는 섹션 
- 3번 섹션 : 영화 & 드라마 포스트를 보여주는 슬라이드 섹션

그래서 크게 `category_group_button.dart`, `content_main_info_section.dart`, `carousel_poster_slider.dart` 3가지의 `섹션 소스파일`로 나누어지게 됩니다.  <br>

#### `2. 섹션을 기준으로 한번 더 분리`
그 다음 앞서 나누어진 섹션 내에서도 동일한 기준으로 분리합니다. 2번 섹션 `content_main_info_section.dart`를 예로 들어보죠. 총 4개로 나누어집니다. <br>

- 컨텐츠의 제목
- 연령제한 인디케이터 + 개봉년도
- 컨텐츠 줄거리 
- 버튼 리스트 (Intent Buttons) <br>

여기서 주의할건 제일 처음 큰 섹션으로 나누었을 때는 별도의 `소스 파일`을 만들어 위젯을 분리하지만 섹션 내의 뷰들을 나눌 때는 저는 따로 소스파일을 만들지 않습니다. 대신 해당 소스파일에 분리한 위젯을 구성합니다. <br>

---
## 코드
설명이 조금 복잡했습니다. 코드로 확인해볼게요.
#### `2번 섹션, content_main_info_section.dart`
```dart
import 'package:flutter/material.dart';

class CategoryGroupButton extends StatelessWidget {
  const CategoryGroupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContentTitle(),
        GratednYear(),
        ContentDescription(),
        IntentButtons(),
      ],
    );
  }
}

// 컨텐츠 섹션
class ContentTitle extends StatelessWidget {
  const ContentTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ...title Widget
  }
}

// 연령 표시 & 개봉연도
class GratednYear extends StatelessWidget {
  const ContentTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ...some Widget
  }
}

// 버튼 리스트
class IntentButtons extends StatelessWidget {
  const IntentButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ...some Widget
  }
}

// 버튼 리스트
class ContentDescription extends StatelessWidget {
  const ContentDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ...some Widget
  }
}

// 버튼 리스트
class IntentButtons extends StatelessWidget {
  const IntentButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ...some Widget
  }
}
```
이렇게 나누어진 섹션 위젯에서 한번 더 뷰를 분리할 때는 따로 소스파일을 만들지 않고 해당 섹션에 위치해둡니다. 다만 다른 스크린에서도 글로벌하게 사용되는 위젯이면 당연하게도 소스파일을 만들어 분리합니다! <br>

❗ 그리고 여기서 주의해야될건 뷰 위젯을 분리할 때 `메소드 형태로 분리` 하지 않았다는 것 입니다.
```dart
class CategoryGroupButton extends StatelessWidget {
  const CategoryGroupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        contentTitle(), // <-- 메소드로 분리
        GratednYear(),
        ContentDescription(),
        IntentButtons(),
      ],
    );
  }

  Widget contentTitle() => ...some title Widget; // <-- 분리된 메소드
}
```
위 코드 예시처럼 특정 뷰 위젯을 메소드로 분리하게 되면 위젯을 새로 빌드할 때 메소드로 나눈 영역도 불필요하게 렌더링이 되어서 CPU 주기를 낭비하게 됩니다.<br>
그래서 가능한 메소드로 분리된 영역을 `statless Widgets`으로 변환해주시는게 좋습니다.
자세한 이슈는 해당 <a href ="https://iiro.dev/splitting-widgets-to-methods-performance-antipattern/">블로그 포스팅</a>을 참고해주세요! 

___ 

## 폴더 구조
이번엔 폴더 구조를 살펴봅시다. 
- lib
  - `screens`
    - `home`
      - home_screen.dart 
      - `localWidget`
        - category_group_button.dart
        - content_main_info_section.dart
        - carousel_poster_slider.dart
  - `widgets` 
    - gradient_intent_button.dart

  
### screen
`screen` 폴더에서 어플리케이션에서 사용되는 스크린 소스들을 관리합니다. 

### home
스크린에 해당되는 섹션으로 폴더명을 짓습니다. 해당 폴더에서는 `스크린 소스파일`(home_screen.dart)과 `localWidget`폴더를 담고 있습니다.

### localWidget
해당 폴더에서 특정 스크린 섹션에서만 사용되는 위젯들을 관리합니다. 

### widgets 
해당 폴더에서는 두 개 이상의 스크린에서 사용되는 위젯들을 관리합니다.
    

___ 

## 코드를 분리해서 얻는 이점
그럼 코드를 분리해서 얻는 이점은 어떤게 있을까요?

### 1. 퍼포먼스 최적화
코드를 단순히 나눈다고 어플리케이션의 퍼포먼스가 최적화 되지는 않아요. 다만 퍼포먼스를 최적화 할 수 있는 환경을 구성할 수 있게 됩니다.
```dart
class CategoryGroupButton extends StatefulWidget {
  const CategoryGroupButton({Key? key}) : super(key: key);

  @override
  State<CategoryGroupButton> createState() => _CategoryGroupButtonState();
}

class _CategoryGroupButtonState extends State<CategoryGroupButton> {

  void someMethod() {
    ...
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpensiveAndComplexWidgte(), // <-- 무겁고 복잡한 위젯
        TextButton(onPressed: (){
          setState(() {
            someMethod();  
          });
        }, child: const Text("Test Button"),)
      ],
    );
  }
}

```
- `무겁고 복잡한 위젯`과 `setState를 사용하는 TextButton 위젯`이 Column 레이아웃에 있다고 가정해봅시다.
- 만약 위 코드처럼 분리가 안되어 있는 상태에서 `setState`를 사용하게되면 `무겁고 복잡한 위젯`이 불필요하게 그려지게 됩니다. 
- 그럼 결국 CPU 주기를 낭비하게 되죠.
- 대신 `TextButton`위젯을 `StateFull Widget`으로 따로 분리하여 동작하게 한다면 불필요한 렌더링을 방지할 수 있게 되고 이는 어플리케이션의 퍼포먼스 향상으로 이어지게 됩니다.


### 2. 가독성
- 그 누구도 복잡한 `스파게티 코드`를 보는건 즐겁지 않죠.
- 코드를 분할하여 가독성을 높이는 것이 본인과 동료들의 정신건강에 좋습니다.
- 다만 코드를 무작정 분할하는게 `가독성이 있는 코드`라고 보지는 않습니다.
  - 그 전에 구성원들의 코드 스타일을 통일하고 주석을 자세히 다는게 중요하겠죠.


### 유지 보수 용이
- 디자인이 변경되었을 때, 또는 특정 이슈가 생겼을 때 원인을 찾고 수정하는 작업이 필수적입니다.
- 만약 코드가 적절히 분할되어 있지 않다면 수정 구현 작업이 몇 배로 길어질 수 있습니다. 



## 결론
- 코드를 분할 방식
  - 큰 섹션을 기준으로
  - 위젯의 기능과 레이아웃을 기준으로
  - 이때 메소드로 분할 X

- 코드를 분할해서 얻는 이점
  - 퍼포먼스 최적화
  - 가독성 
  - 유지 보수 용이







