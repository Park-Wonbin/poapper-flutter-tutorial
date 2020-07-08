<img src="https://flutter.dev/assets/flutter-lockup-c13da9c9303e26b8d5fc208d2a1fa20c1ef47eb021ecadf27046dea04c0cebf6.png" alt="img" style="zoom:25%;" />



# Flutter Tutorial

POSTECH 개발 동아리 'PoApper'에서 진행하는 [**Flutter**](https://flutter.dev/) 강의용 repository 입니다.



## Prerequisites

- **macOS**(Android, iOS) 또는 Windows(Android만 테스트 가능)
- Git
- IDE: **Android Stduio**(추천) 또는 IntelliJ 또는 Visual Studio Code
  - macOS의 경우 iOS 테스트를 위해  Xcode도 설치해야 됨



## Reference Materials

- [Flutter Docs](https://flutter-ko.dev/docs)
- [Flutter Widget of the Week](https://www.youtube.com/watch?v=b_sQ9bMltGU&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG)
- [Flutter packages](https://pub.dev/)



## Getting Started

[**Flutter 설치하기**](https://flutter.dev/docs/get-started/install)

- 세미나 시작전에 'Get started 1~4'을 꼭 읽고 따라하세요!

**Flutter는 Dart 언어를 사용합니다.**

- 이 세미나에서는 Dart 언어를 몰라도 Flutter로 바로 앱을 만들어보면서 익힐 것 입니다.
- Dart 언어가 더 궁금하다면 [여기서](https://dart.dev/) 직접 공부해보세요.  

### Download

세미나를 시작하기 위해 이 repository를 clone하세요.

원하는 폴더에 다음 명령어를 칩니다.

```bash
git clone https://github.com/Park-Wonbin/poapper-flutter-tutorial
cd poapper-flutter-tutorial
```



## Lecture 01

### 학습할 내용

- Flutter 프로젝트 생성하기 with **Android Studio**
- 사용자 인터페이스(UI)
  - 위젯이란?
    - Text, Row, Column, Stack, Container 등 기본 위젯 사용법을 알아본다.
  - 레이아웃 만들기
    - Flutter의 레이아웃 메커니즘이 동작하는 방식을 배운다.
    - 위젯을 수평과 수직으로 배치하는 방법을 알아본다.
  - 상호작용 추가하기
    - 탭(Taps)에 어떻게 반응하는지 알아본다.
    - 커스텀 위젯을 만들어본다.
    - `stateless`와 `stateful` 위젯의 차이점을 알아본다.

### 과제

- Flutter 레이아웃, 위젯과 친해지기!
  - [레이아웃 만들기](https://flutter-ko.dev/docs/development/ui/layout/tutorial)
  - [상호작용 추가하기](https://flutter-ko.dev/docs/development/ui/interactive)



## Lecture 02

### 학습할 내용

- 리소스, 이미지 파일 사용하기
  - images 폴더를 생성하고 추가한 파일들을 `pubspec.yaml`에 등록하는 법을 알아본다.
  - 추가한 이미지를 불러와 표시해본다. 
  - 앱 아이콘 변경해보기 → Android, iOS 따로 적용해야한다.
    
    - > 안드로이드 Image Asset에서 "project must be built with sdk 26 or later to use adaptive icons" 에러 발생시, Project Structure → Modules → my_project_android → Dependencies에서 Module SDK 버전을 26이상으로 바꿔주면 해결된다.
- 내비게이션 및 라우팅
  - 새로운 화면으로 이동하고, 되돌아오는 방법을 배운다.
  - Route 개념을 알고 `named route`를 사용하는 법을 알아본다.
  - 인자를 `named route`를 통해 전하는 법을 알아본다.
  - 이전 화면으로 데이터를 반환하는 방법을 알아본다.
  - 화면을 넘나드는 위젯 `Hero`를 이용하여 애니메이션을 만들어본다.
- Lists 사용하기
  
  - ListView, ListTile, GridView 등을 사용해보기

### 과제

- 학습한 내용 실습해보기!
  - [Adding assets and images](https://flutter-ko.dev/docs/development/ui/assets-and-images)
  - [Navigation and routing](https://flutter-ko.dev/docs/development/ui/navigation)
  - [Lists](https://flutter-ko.dev/docs/cookbook/lists)



## Lecture 03

### 학습할 내용

- 고급 UI
  - `SliverList`, `SliverAppBar` 등 사용해서 멋있는 스크롤뷰 구현하기
  - `GestureDetector`를 사용해서 탭, 길게 누르기 등의 제스처 구현하기
  - 다크모드 적용하는 법을 알아본다.
- 데이터 & 백엔드
  - [상태 관리](https://flutter-ko.dev/docs/development/data-and-backend/state-mgmt/intro)
  - `Provider`를 활용하여 로그인 페이지 구현해보기
    - Pub.dev에서 외부 패키지 받아서 추가하기(`puvspec.yaml`)

### 과제

- 학습한 내용 실습해보기!
  - [Slivers](https://flutter-ko.dev/docs/development/ui/advanced/slivers)
  - [Gesture](https://flutter-ko.dev/docs/development/ui/advanced/gestures)
  - 다크모드 구현하기
- **Provider 공부하기**



## Lecture 04

### 학습할 내용

- 네트워킹
  - Retrofit
    - [**pub.dev**](pub.dev)에서 **retrofit** 패키지를 받아 적용한다.
    - Retrofit API를 사용하는 방법을 알아본다.
- FutureBuilder 알아보기

### 과제

- Retrofit 실습해보기!
- FutureBuilder 이해하기!



## Lecture 05

### 학습할 내용

- 릴리즈(?)

### 과제 

- Assn 완성하여 설치 파일 제출하기(?)



## Assn

### 주제: 게시판 앱 만들기

### 요구사항

- 최소 페이지 2개
  - 메인 페이지(게시글 목록)
  - 게시글 작성 페이지
- 여러 위젯들을 사용하여 UI를 예쁘게 꾸며야함, 앱 아이콘을 변경해야 됨
  - `Material` 디자인이 기본이나 원하면 `Cupertino` 디자인으로 해도 됨
  - 가능하면 `Sliver`, `Hero` 꼭 넣어서 디자인 해보기
  - 다크모드 지원하면 추가점수 😊
  - 위에서 배우진 않았지만 `TextField`, `FloatingActionButton` 위젯을 찾아보고 활용하면 도움이 됨
  - 그밖에 필요할 것 같은 위젯은 [여기서](https://flutter.dev/docs/development/ui/widgets/material) 보고 골라서 사용하면 됨
- 튜토리얼 서버에 있는 게시판 API를 활용할 것
  - `Retofit`, `Provider`, `FutureBuilder`를 이용하여 서버의 게시글을 받아올 것
  - 글 목록 보기, 글 작성, 글 삭제 기능을 구현해야 됨
  - 튜토리얼 API 사용 방법은 [**여기서**](http://binvitstudio.com/poapper/api/) 참고 
- 게시판 앱 완성 후 게시글 최소 1개 이상 작성하기
  - 첫 글에 본인 이름 넣어서 완성했다고 알리기

### 제출방법

완성된 소스코드를 본인 [**GitHub**](https://github.com/)에 올린 후 링크 제출(간단한 앱 설명 넣어서 README.md 꾸미면 추가점수 😊)

완성된 실행파일 압축해서 카톡으로 제출

