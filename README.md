# flutter_movie_app
TMDB API를 이용한 영화 정보 앱 입니다. hero 애니메이션을 사용했습니다. 클린 아키텍쳐로 구성되어있습니다.

종속성
----------

"""
dependencies:
  flutter:
    sdk: flutter
  flutter_dotenv: ^5.2.1
  json_annotation: ^4.8.0
  dio: ^5.0.5
  flutter_riverpod: ^2.6.1
  cupertino_icons: ^1.0.8
"""

homepage
==========
![image](https://github.com/user-attachments/assets/62d4f606-0bb8-434a-8487-6ac737ed7645)    

가장인기있는 영화, 현재 상영중, 인기순, 평점 높은순, 개봉예정 영화 목록을 세로 리스트 뷰로 보여줍니다.    
가장인기있는 영화를 제외힌 각 목록은 가로 리스트 뷰로 보여줍니다.    
각 포스터를 클릭하면 영화의 세부정보가 들어가있는 detailpage로 이동합니다.

detailpage
==============
![image](https://github.com/user-attachments/assets/f2701f34-1672-4c02-9edd-ad47b9964925)    

- `영화 제목` `개봉일`    
- `태그라인`    
- `러닝타임`    
- `카테고리` 들   
- `영화설명`    
- `평점` `평점투표수` `인기점수` `예산` `수익` 가로 리스트뷰    
- `제작사`
와 같은 정보를 담고 있습니다.
