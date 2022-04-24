## Manage Flutter Imports Clean
<div align="center">
<img width="815" src="https://user-images.githubusercontent.com/75591730/164958178-2daf374a-2316-4d01-87e3-515a46f79438.png">
</div>

Flutter로 개발을 하면서 외부 패키지 파일이나 위젯들을 `import` 하는 경우가 많습니다. 하나의 소스 파일에서 여러 패키지나 위젯을 필요로 하는 경우 위 사진의 코드처럼 많은 `import`코드를 작성하게 됩니다. <br>
이렇게 하나의 소스파일에서 여러 `import`를 코드를 적다보면, 수정 과정에서 불필요하게 파일을 호출하거나 유지 보수를 할 때도 번거롭다는 단점이 있습니다. 코드의 가독성도 좋지 않죠. 


## `Multiple Imports` to `Single Import`
그래서 필자는 하나의 소스파일에서 필요한 파일을 가져오는 `Multiple Imports`방식 보다 파일을 하나 만들어 `Import`를 관리하는 `Single Import`방식을 선호합니다.
<br>

## 코드
코드로 확인하시죠<br>
``` 
lib > utilites > index.dart 
```
``` dart
/* Flutter Packages */
export 'package:flutter/material.dart';
export 'package:flutter/foundation.dart';
export 'package:flutter/services.dart';

/* Packages */
export 'package:fluro/fluro.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:flutter_hooks/flutter_hooks.dart';
export 'package:sizer/sizer.dart';
export 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
export 'package:get/get.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
export 'package:carousel_slider/carousel_slider.dart';

/* Screens */
export 'package:movie_curation/screens/root/root_screen.dart';
export 'package:movie_curation/screens/home/home_screen.dart';
export 'package:movie_curation/screens/home/mobile/home_screen_mobile.dart';
export 'package:movie_curation/screens/home/tablet/home_screen_tablet.dart';
export 'package:movie_curation/utilities/temp_screen.dart';
export 'package:movie_curation/utilities/temp_screen.dart';
export 'package:movie_curation/screens/movieDetail/tablet/movie_detail_tablet.dart';
export 'package:movie_curation/screens/movieDetail/mobile/movie_detail_mobile.dart';
export 'package:movie_curation/screens/movieDetail/movie_detail_screen.dart';
export 'package:youtube_player_flutter/youtube_player_flutter.dart';
export 'package:movie_curation/screens/contentPlayer/content_player_screen.dart';
export 'package:movie_curation/screens/root/root_screen_mobile.dart';
export 'package:movie_curation/screens/searchScreen/search_screen_tablet.dart';

/* Models */
export 'package:movie_curation/models/movie_model.dart';
export 'package:movie_curation/models/movie_genre_model.dart';
export 'package:movie_curation/models/actor_model.dart';
export 'package:movie_curation/models/trailer_model.dart';
export 'package:movie_curation/models/youtube_model.dart';
export 'package:movie_curation/models/youtube_core_model.dart';
export 'package:movie_curation/models/video_detail_model.dart';
export 'package:movie_curation/models/drama_model.dart';

/* View Models */
export 'package:movie_curation/viewModels/movie_view_model.dart';
export 'package:movie_curation/services/youtube_api_response.dart';
export 'package:movie_curation/viewModels/youtube_view_model.dart';
export 'package:movie_curation/viewModels/search_content_view_model.dart';

/* Widgets */
export 'package:movie_curation/widgets/responsive_layout.dart';
export 'package:movie_curation/widgets/gradient_button.dart';
export 'package:movie_curation/widgets/category_group_button.dart';
export 'package:movie_curation/widgets/gradient_post_background.dart';
export 'package:movie_curation/widgets/movie_content_info.dart';
export 'package:movie_curation/widgets/movie_post_slider.dart';
export 'package:movie_curation/widgets/trailer_dialog.dart';
export 'package:movie_curation/screens/movieDetail/localWidget/cast_slider.dart';
export 'package:movie_curation/screens/movieDetail/localWidget/movie_else_info.dart';
export 'package:movie_curation/widgets/back_arrow_button.dart';
export 'package:movie_curation/screens/movieDetail/localWidget/main_content_info_mobile.dart'; // MovieDetailScreen(M) > MainContentInfoMobile
export 'package:movie_curation/screens/movieDetail/localWidget/youtube_reviewCotents_wheel_slider.dart'; // MovieDetailScreen(T) > WheelSlider

/* Services */
export 'package:movie_curation/services/movie_api_response.dart';

/* Utilities */
export 'package:movie_curation/utilities/palette.dart';
export 'package:movie_curation/utilities/orientation.dart';
export 'package:movie_curation/utilities/scroll_controller.dart';
export 'package:movie_curation/utilities/data/dummy_data.dart';
export 'package:movie_curation/utilities/responsive_size.dart';

/* Routes */
export 'package:movie_curation/routes/fluro_router.dart';
```
`Single Import` 방식으로 파일을 관리하는 방법은 간단합니다. 
- index.dart 파일 생성 
- 다른 소스파일에서 호출이 필요한 export 코드 작성
- import가 필요한 파일에서 `index.dart` 호출

<div align="center">
<img width="815" src="https://user-images.githubusercontent.com/75591730/164958942-60492659-683f-4eaf-bdfc-61b74411986e.gif">
</div>

이렇게 간단하게 `import` 파일들을 관리할 수 있습니다.<br>

## 결론
`Single Import` 방식으로 필요 파일들을 import 
- 코드 가독성 향상
- 유지 보수 용이 




