# mips-processer
베릴로그로 파이프라인이 있는 밉스 컴퓨터 설계


adder.v : adder모듈. \n
aludec.v : 어떤 연산을 해야 하는지 각 연산에 맞게 컨트롤 비트를 정해줌.\n
controller.v : aludec 모듈과 maindec모듈을 가지고 있는 컨트롤 모듈.\n
datapath.v : 컨트롤 모듈을 제외한 모든 모듈이 속해 있음.\n
dmem.v : 데이터 메모리\n
flopenr.v : 플리플롭 모듈. reset과 enable값이 모두 0이고 enable변수 값이 0이면 이전 값유지. reset, enable이 0이고 en값이 1이면 값 로드. reset값이 1이면 아웃풋을 0으로 초기화.\n
flopenrc.v : 플리플롭 모듈. flopenr에서 clear비트 추가.\n
flopr.v : 플리플롭 모듈. reset, clear가 1이 아니면 값 업데이트. 유지시켜주는 기능 없음.\n
floprc.v : 플리플롭 모듈. floprc에서 clear비트 추가.\n
forwarding_unit.v : 어떤 포워딩인지 결정.\n
hazard_detection_unit.v :  output으로 stall 값을 보내는 해저드 검출 모듈.\n
imem.v : 명령어 메모리\n
maindec.v : 명령어를 해석해주는 모듈\n
mips.v : controller모듈과 datapath 모듈을 가진 모듈\n
mipscomputer.v : 가장 큰 모듈\n
mux2.v : 먹스\n
mux3.v\n
regfile.v : 레지스터파일\n
signext.v : 부호 확장. 데이터 크기에 따라 표기법이 달라지므로 필요.\n

