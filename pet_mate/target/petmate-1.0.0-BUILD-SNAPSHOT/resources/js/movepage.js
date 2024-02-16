/**
 * 
 */
 
 function serverCallByRequest(jobCode, methodType, clientData){
	const form = createForm("", jobCode, methodType);
	
	document.body.appendChild(form);
	form.submit();
}

/* FORM 생성 */
function createForm(name, action, method){
	const form = document.createElement("form");
	if(name != "") form.setAttribute("name", name);
	form.setAttribute("action", action);
	form.setAttribute("method", method);
	return form;
}