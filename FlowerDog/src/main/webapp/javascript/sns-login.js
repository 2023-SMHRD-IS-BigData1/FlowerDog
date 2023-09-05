// SNS 로그인

const toggleAccount = ()=> setNewAccount((prev)=>!prev);

const onSocialClick = (event)=>{
    console.log(event.target.name);
    const {target : {name},} = event;
    let provider;
    if(name ==="naver"){
        provider = new (DB주소값).auth.NaverAuthProvider();
    }else if(name ==="kakao"){
        provider = new (DB주소값).auth.KakaoAuthProvider();
    }else if(name ==="google"){
        provider = new (DB주소값).auth.GoogleAuthProvider();
    }
};

