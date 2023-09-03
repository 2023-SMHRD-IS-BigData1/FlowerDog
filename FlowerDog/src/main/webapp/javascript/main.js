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

// 페이징
