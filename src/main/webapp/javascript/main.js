
// 사이드메뉴 온클릭 이벤트
let cnt = 0;
function sideMenu() {
    let element_bar = document.getElementsByClassName("main-menu__side-bar")[0];
    console.log(element_bar);         
    if(cnt%2==1){
        element_bar.classList.add('close_menu-ani');
        element_bar.classList.remove('open_menu-ani');
    }else if(cnt%2==0){
        element_bar.classList.add('open_menu-ani');
        element_bar.classList.remove('close_menu-ani');
    }
    cnt += 1;
    console.log(element_bar.className);
}

// 마이페이지 사진업로드 경로설정
$("#picture-file").on('change', function () {
    let fileName = $("#picture-file").val();
    let userImg = $(".picture-box").val();
    $(".user-picture").val(fileName);
});

function PreviewImage() {
    // 파일리더 생성 
    var preview = new FileReader();
    preview.onload = function (e) {
    // img id 값 
    document.querySelector(".picture-box").src = e.target.result;
};
// input id 값 
preview.readAsDataURL(document.querySelector("#picture-file").files[0]);
}