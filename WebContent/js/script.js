function zipCheck(){
	url = "zipcheck.jsp?check=y"; 
	window.open(url,"post",
		"toolbar=no,width=350,height=300,top=200,left=300,status=yes,scrollbars=yes,menubar=no");
}

function idCheck(){
	if(regForm.id.value === ""){
		alert("id를 입력하시오");
		regForm.id.focus();
	}else{
		url = "idcheck.jsp?id=" + regForm.id.value;
		window.open(url,"","width=300,height=150,left=150,top=150");
	}
}

function inputCheck1(){
	var regExp2 = /^\d{3}-\d{3,4}-\d{4}/; 
	var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;

	if(regForm.id.value == ""){
		alert("아이디 입력하세요");
		regForm.id.focus();
		return;
	}
	
	else if(regForm.pw.value == ""){
		alert("비밀번호 입력하세요");
		regForm.passwd.focus();
		return;
	}
	else if(regForm.pw.value !== regForm.repasswd.value){
		alert("비밀번호가 일치하지 않습니다.");
		regForm.passwd.focus();
		return;
	}
	
	else if(regForm.name.value == ""){
		alert("이름 입력하세요");
		regForm.name.focus();
		return;
	}
	else if(regForm.email.value == ""){
		alert("이메일 입력하세요");
		regForm.email.focus();
		return;
	}
	else if(regForm.phone.value == ""){
		alert("전화번호 입력하세요");
		regForm.phone.focus();
		return;
	}
	else if(regForm.zipcode.value == ""){
		alert("주소 입력하세요");
		regForm.zipcode.focus();
		return;
	}
	else if(!regForm.email.value.match(regExp)){
		alert("이메일을 정확히 입력하세요")
		regForm.phone.focus();
		return;
	}
	else if(!regForm.phone.value.match(regExp2)){
		alert("전화번호를 정확히 입력하세요 \n 000-0000-0000 형식")
		regForm.phone.focus();
		return;
	}
	regForm.submit();
}


//쇼핑몰 로그인 후 자신의 정보 수정 시 사용
function memberUpdate(){ 
	var regExp2 = /^\d{3}-\d{3,4}-\d{4}/; 
	var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;

	if(updateForm.pw.value == ""){
		alert("비밀번호 입력하세요");
		regForm.passwd.focus();
		return;
	}
	
	else if(updateForm.name.value == ""){
		alert("이름 입력하세요");
		regForm.name.focus();
		return;
	}
	else if(updateForm.email.value == ""){
		alert("이메일 입력하세요");
		regForm.email.focus();
		return;
	}
	else if(updateForm.phone.value == ""){
		alert("전화번호 입력하세요");
		regForm.phone.focus();
		return;
	}
	else if(updateForm.zipcode.value == ""){
		alert("주소 입력하세요");
		regForm.zipcode.focus();
		return;
	}
	else if(!updateForm.email.value.match(regExp)){
		alert("이메일을 정확히 입력하세요");
		regForm.phone.focus();
		return;
	}
	else if(!updateForm.phone.value.match(regExp2)){
		alert("전화번호를 정확히 입력하세요");
		regForm.phone.focus();
		return;
	}
	document.updateForm.submit();
}
function memberUpdateCancel(){
	location.href="../guest/guest_index.jsp";
}


//관리자 관련 
function funcAdminLogin(){
	if(adminLoginform.adminid.value === ""){
		alert("아이디를 입력하시오");
		adminLoginform.adminid.focus();
		return;
	}
	if(adminLoginform.adminpasswd.value === ""){
		alert("비밀번호를 입력하시오");
		adminLoginform.adminpasswd.focus();
		return;
	}
	adminLoginform.submit();
}
function funcAdminHome(){
	location.href = "../main.jsp";
}

//관리자 입장에서 각 회원 수정
function memUpdate(id) {
	//alert(id);
	document.updateFrm.id.value = id;
	document.updateFrm.submit();
}

function memberUpdateAdmin(){
	document.updateFormAdmin.submit();
}
function memberUpdateCancelAdmin(){
	location.href = "membermanager.jsp";
}

//관리자에서 상품처리
function productDetail(no){
	document.detailForm.no.value = no;
	document.detailForm.submit();
}
function productUpdate(no){
	if(confirm("정말 수정할까요?")){
		document.updateForm.no.value = no;
		document.updateForm.submit();
	}
}
function productDelete(no){
	if(confirm("정말 삭제할까요?")){
		document.delForm.no.value = no;
		document.delForm.submit();		
	}
}

//사용자에서 상품 처리
function productDetail_guest(no){ 
	document.detailFrm.no.value = no;
	document.detailFrm.submit();
}

//카트 처리용
function cartUpdate(form){
	form.flag.value = "update";
	form.submit();
}
function cartDelete(form){
	form.flag.value = "del";
	form.submit();
}

//관리자에서 주문 처리
function orderDetail(no){
	document.detailFrm.no.value = no;
	document.detailFrm.submit();
}

function orderUpdate(form){
	document.detailFrm.flag.value = "update";
	form.submit();
}

function orderDelete(form){
	document.detailFrm.flag.value = "delete";
	form.submit();
}
