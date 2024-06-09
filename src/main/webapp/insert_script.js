/**
 * 
 */
function insert() {
	// validation
	let result = validate();
	if (result == false) {
		alert("validate failed!");
		return;
	}
	
	// form submit
	document.insertForm.submit();
}

function validate() {
	let frm = document.insertForm;
	// 학번 체크
	if (!frm.sid.value || !frm.sid.value.trim()) {
		alert("학번이 입력되지 않았습니다!");
		frm.sid.focus();
		return false;
	}
	
	// 중간고사 체크
	if (!frm.midscore.value || !frm.midscore.value.trim() || isNaN(frm.midscore.value)) {
		alert("중간고사는 숫자가 아니거나 입력되지 않았습니다!");
		frm.midscore.focus();
		return false;
	}
	
	// 기말고사 체크
	if (!frm.finalscore.value || !frm.finalscore.value.trim() || isNaN(frm.finalscore.value)) {
		alert("기말고사는 숫자가 아니거나 입력되지 않았습니다!");
		frm.finalscore.focus();
		return false;
	}
	
	// 출석 체크
	if (!frm.attend.value || !frm.attend.value.trim() || isNaN(frm.attend.value)) {
		alert("출석은 숫자가 아니거나 입력되지 않았습니다!");
		frm.attend.focus();
		return false;
	}
	
	// 레포트 체크
	if (!frm.report.value || !frm.report.value.trim() || isNaN(frm.report.value)) {
		alert("레포트는 숫자가 아니거나 입력되지 않았습니다!");
		frm.report.focus();
		return false;
	}
	
	// 기타 체크
	if (!frm.etc.value || !frm.etc.value.trim() || isNaN(frm.etc.value)) {
		alert("기타는 숫자가 아니거나 입력되지 않았습니다!");
		frm.etc.focus();
		return false;
	}
	
	// 유효성 체크 성공
	alert("성적정보가 정상적으로 등록되었습니다!");
	return true;
}

function reset_form() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.insertForm.reset();
}



