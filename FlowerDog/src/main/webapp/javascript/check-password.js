
// 비밀번호 두개의 값을 일치여부 확인 후 출력
let firstPw = document.querySelector(".first-pw"); // 비밀번호 첫번째
let finalPw = document.querySelector(".final-pw"); // 비밀번호 확인에 적은 비번

let nextNick = document.querySelector(".input-name"); // 이름 적는 input의 클래스명이 input-name 이라면

let check = document.querySelector(".check-pw"); // 출력될 문구

let cntPass = true;

function checkPw(){
    if(firstPw.value != finalPw.value){ // 첫번째 두번째 비밀번호가 다르면
        check.innerText = "비밀번호가 다릅니다."; //출력될 문구 변경
        cntPass = false;
    }else{
        check.innerText = "비밀번호가 일치합니다.";//출력될 문구 변경
        cntPass = true;
    }

}
nextNick.addEventListener('click',checkPw); // 이름 칸 입력하려고 마우스로 눌렀을 때 실행되도록
nextNick.addEventListener('focus',checkPw);// 이름 칸 입력하려고 탭키로 포커스 바꿨을 때 실행되도록


// 회원가입시 비밀번호 일치여부 확인
function jbSubmit() {
    if ( cntPass == false ) {
      alert( '비밀번호가 다릅니다.' );
      return false;
    }
  }