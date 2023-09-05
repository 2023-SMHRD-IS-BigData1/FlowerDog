let firstPw = document.getElementsByClassName(".first-pw")[0];
let finalPw = document.getElementsByClassName(".final-pw")[0];
let field = document.getElementsByClassName(".sign-up__field")[0];
let check = document.getElementsByClassName(".check-pw")[0];

function checkPw(){
console.dir(field);
    if(firstPw.value != finalPw.value){
        check.innerText = "비밀번호가 다릅니다.";
    }else{
        check.innerText = "비밀번호가 일치합니다.";
    }

}

field.addEventListener('click',checkPw);
field.addEventListener('focus',checkPw);