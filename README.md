#운영체제 2주차 
141068 이재봉 
### 리눅스 기본 사용법 
####Shell이란?
운영체제를 이용하기 위한 유저 인터페이스 프로그램을 쉘이라 칭한다.

리눅스의 터미널과 같은 인터페이스를 명령-라인 인터페이스(CLI)라 칭하며 보통 셸이라 하면 CLI를 의미한다. 그래픽 인터페이스(GUI) 또한 셸이기도 하다.

셸은 사용자의 원활한 컴퓨팅 작업을 지원하기 위해 만들어졌으며, 사용자 입력 처리, 운영체제가 제공하는 기능을 사용하기 위한 명령어 처리, 프로그램의 실행 등을 할 수 있다. 

우리가 보통 리눅스 명령어라고 칭하는 명령어들은 셸에서 쓰는 명령어이다. 

#### 파일과 디렉토리 
#####File System 
`파일이라는 개념으로 데이터를 다루는 저장 체계`

디렉토리 : 파일이 저장되는 논리적인 저장소이며 트리 형태의 계층 구조로 이루어져 있다. 리눅스의 경우 전체 파일 시스템은 root디렉터리에서 시작한다. 

#####리눅스의 기본 디렉터리 구조 

boot : 리눅스의 커널 이미지 파일 

dev  : 장치 파일 (노드) 

proc : 시스템 정보를 파일로 제공

etc  : 시스템 설정 파일

var :시스템 로그, 이메일 등

tmp :임시 파일

bin : 리눅스 명령어 실행 파일

sbin : 시스템 관리 명령어 실행 파일

lib : 프로그램 실행을 위한 라이브 ,러리 파일 (glibc 등)

usr :사용자 의존적인 시스템 파일 ,/usr/bin, /usr/lib 등 

#### 파일 접근 권한과 사용자 식별 
##### 파일 접근 권한 
`각 파일마다 지정된 사용자 접근 허용 정보`

읽기, 쓰기, 실행(탐색) 에 대한 권한을 설정할 수 있다. 

#####사용자 식별 
`프로그램의 동작 권한을 제어하기 위한 수단`

운영체제나 다른 사용자의 자원에 대한 접근을 허용하거나 차단한다. 

사용자 ID 혹은 그룹ID (숫자로 부여되는 사용자 식별자)를 통해 접근권한을 판단한다. 

### 리눅스 명령어 
[여기에!](http://betatester.tistory.com/23)



