###운영체제 5주차 
141068 이재봉 
####리눅스 기초 사용법 
#####프로그램의 컴파일과 실행 
hello.c 컴파일 과정 

1. Pre-processor(전처리기)에서 hello.c에 있는 전처리 과정을 끝낸 후 hello.i라는 파일을 만들어 낸다. 
2. Compiler에서 C코드를 어셈블리코드로 전환하여  hello.s라는 파일을 만들어 낸다. 
3. 어셈블러가 어셈블리코드를 해석하여 오브젝트 파일이자 바이너리 파일인 hello.o 파일을 만들어 낸다. 
4. 마지막으로 Linker(링커)가 시스템 라이브러리와 오브젝트코드를 연결하여 실행파일(역시 바이너리 파일)을 만들어낸다.

 

####gcc (GNU C Compiler)
gcc의 구성 요소 

- 전처리기 
- 컴파일러
- 어셈블러
- 링커 

#####주요 옵션 

가장 많이 쓰이는 옵션 

- -g : 디버깅 정보를 포함하여 출력 파일 생성
- -W : 문법적으로 틀리지는 않지만 애매한 코드에 대한 경고메세지 출력
- -Wall : 애매한 코드에 대한 경고매세지 모두 출력
- -O2 : 최적화 수준2 (O1~O3)
- -o \<fileName> : 출력 실행 파일 이름 지정 (옵션이 없으면 a.out으로 생성)

출력 제어 옵션 

- -E : 전처리 결과를 화면에 출력
- -S : 컴파일만 수행, *.s파일 생성
- -c : 컴파일과 어셈블만 수행 , *.o 파일 생성 
- -v : 컴파일 과정의 각 명령어와 gcc번전 정보 표시 
- -save-temps :컴파일 중관 과정의 파일들을 생성 (\*.i, *.s)

##### gcc로 여러 소스 파일 컴파일 하기

main.c와 printHello.c 파일이 있다고 가정 

방법1. 기본적인 방법 

1. 각각 소스파일의 컴파일 

	* gcc -g -W -Wall -O2 -c main.c 
	* gcc -g -W -Wall -O2 -c printHello.c 

2. 오브젝트 코드 링크 
	* gcc –g –W –Wall –O2 –o hello main.o printhello.o

방법2. 일반적인 방법 

__gcc가 통합적으로 처리 __

- gcc –g –W –Wall –O2 –o hello main.c printhello.c

그렇다면 정말 많은 소스 파일은 어떻게 컴파일?

#### make 명령어 
`규모가 큰 프로그램을 컴파일하기 위한 유용한 도구`

Makefile이라는 것을 만들어 컴파일/빌드 규칙들을 기술 

- 각 소스파일들 간의 dependency를 명시함 

##### 기본 사용법 
`make [-f makefile명] [options] [target] `

- 별도의 파일을 지정하지 않으면 현재 디렉터리의 "makefile"혹은 "Makefile"을 이용함
- 타겟을 지정하지 않으면 "all"을 타겟으로 지정한다. 

#####Makefile의 기본구성 

######target
- 명령행에 지정된 명령을 실행하여 타겟을 빌드
- 종속성에 지정된 파일이 없으면 해당 빌드 수행
- 종속성 파일의 갱신되면 타겟을 다시 빌드
- all과 clean
	- all : 모든 빌드 타겟을 종속성 목록에 명시 
	- clean : make에 의해 생성된 파일들을 삭제
- 명령행은 반드시 [tab]으로 시작해야 된다. 

makefile 예제

```	
# makefile for hello
CC = gcc                		# CC : 컴파일러 명시 
CFLAGS = -g -W –Wall -c 		# CFLAGS : 컴파일 옵션 명시 
all: hello
hello: main.o factorial.o hello.o
$(CC) -o hello main.o factorial.o hello.o
main.o: main.c functions.h
$(CC) $(CFLAGS) main.c
factorial.o: factorial.c functions.h
$(CC) $(CFLAGS) factorial.c
hello.o: hello.c
$(CC) $(CFLAGS) hello.c
clean:
rm -rf *.o hello
```

####Debugger (디버거)

디버거의 기본 기능 

- 프로그램 코드의 단계적 실행 
- 설정된 중단점(break point)까지 실행 
- 메모리나 레지터의 값을 확인 

####gdb 
`GNU에서 제작한 디버거 `

gdb \<program> 명령어를 통해 실행 

#####gdb 명령어 

프로그램 실행 

- run [명령 인자] : 디버깅할 프로그램 실행 
- continue : 중단된 프로그램 실행 재개 
- kill : 중단된 프로그램 실행 종료 
- step/stepi, next/nexti\<숫자> : 소스 수준 / 명령어 수준에서 단계적 실행 
- finish : 현재 함수의 return까지 실행 
- return [리턴 값] : 값를 return 하고 함수 종료 
- quit : gdb 종료 

중단점 (break point)

- break <함수 이름/ 라인 넘버/ *메모리 주소> : 지정된 위치에 break point 설정 
- info breakpoints : 설정된 breakpoint들 표시 
- delete <breakpoint 번호> : 설정된 breakpoint 삭제
- enable/disable <breakpoint 번호> : 지정된 breakpoint 활성/비활성 
- clar <함수 이름> : 함수 내 모든 breakpoint 삭제


메모리 확인 

- display [/표시형식] <변수 이름> : 변수의 값이 유효한 코드 부분에서 값을 계속해서 표시
- undisplay : display종료 
- print [/표시형식] <변수이름 / *메모리주소 / 레지스터이름> : 현재 / 지정된 위치의 프로그램 소스 코드 표시 (표시형식: /d, /x, /t)
- x/[개수][표시형식][단위크기] <주소 / 함수> : 지정된 위치의 메모리 데이터를 지정된 형식으로 표시
	- 표시형식: d, o, x, t, f, s, i 등
	- 단위 크기: b, h, w, g
	
프로그램 코드 확인 

- list [함수이름 / 라인 넘버/ 변수 이름] : 현재/ 지정된 위치의 프로그램 소스 코드 표시 
- disas <함수 이름/ 메모리 주소> : 현재 / 지정된 위치의 프로그램 어셈블리 코드 표시 


변경 값 감지 
- watch <변수 이름> : 변수에 데이터가 쓰여질 때 실행 멈춤 
- rwatch / awatch <변수 이름> : 변수를 읽을 때 / 모든 경우에 실행 멈춤 











