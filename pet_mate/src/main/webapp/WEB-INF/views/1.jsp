<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>

	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script src="../../resources/js/movepage.js"></script>
	<script>
	var naverLogin = new naver.LoginWithNaverId({
        clientId: "kaw3VUicBMBOJ978rXFx", // 본인걸로 수정, 띄어쓰기 금지.
        callbackUrl: "http://192.168.0.108/callback", // 아무거나 설정
        isPopup: false,
        callbackHandle: true
    });
  
    window.addEventListener('load', function (event) {
        naverLogin.getLoginStatus(function (status) {

            if (status) {
            	const user = naverLogin.user;
            	let formData = new FormData();
				//const form = document.createElement("form");
				//form.setAttribute("action", "naverSave");
				//form.setAttribute("method", "post");
  	          	
           		formData.append('userBirth', user.birthday);
            	formData.append('userEmail', user.email);
            	formData.append('userId', user.id);
            	formData.append('userName', user.name);
            	formData.append('userNickName', user.nickname);
				//const name = ['n_age', 'n_birthday', 'n_email', 'n_gender', 'n_id', 'n_name', 'n_nickName'];
				//let data = [user.age, user.birthday, user.email, user.gender, user.id, user.name, user.nickname];
				
				//for(let i=0; i<data.length; i++){
					//const formChild = document.createElement("input");
					
					//formChild.setAttribute("type", "hidden");
					//formChild.setAttribute("name", name[i]);
					//formChild.setAttribute("value", data[i]);
					
					//form.appendChild(formChild);
				//}
            	
               	console.log(user.birthday);
               	console.log(user.email);
               	console.log(user.id);
               	console.log(user.name);
               	console.log(user.nickname);
               	
               	//document.body.appendChild(form);
               	//console.log(form);
               	//form.submit();
               	
              // 	serverCallByFetchAjax(formData, '/naversave', 'post', 'navercom');
               	
                //fetch('naverSave', {
                 //   method: 'POST',
                 //headers: {
                   //  'Content-Type': 'application/json'
                 //},/*
                 //body: new URLSearchParams(formData)
                 //*/
                 //   body: formData
                //}).then(res => {
                //    console.log(res);
                //}).catch(error => console.log(error));
            }
            
        }
        )
    }
    )
    function serverCallByFetchAjax(formData, jobCode, methodType, callBackFunc){
	fetch(jobCode, {
  	method: methodType,
  	/*
    headers: {
    	'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: new URLSearchParams(formData)
    */
    body:formData
  	})
  	.then((response) => response.json())
  	.then((data) => window[callBackFunc](data))
	.catch(error => window[callBackFunc]('error'))
}
    
    
    
    function navercom(){
    	alert(111222);
    }
</script>
</body>
</html>