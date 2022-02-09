var AJAX = {
  call: function(url, paras, func){
    var callobj = {
      url: url,
      type: "post",
      data: paras,
      dataType: "text",
      success: func,
      error: function(xhr, status, error){
        if (xhr.status == 0){
          alert("네트워크 접속이 원활하지 않습니다.");
        }
        else {
          console.log(xhr.responseText);
          alert("에러가 발생하였습니다. 관리자에게 문의해주세요");
        }
      },
    };
    jQuery.ajax(callobj);
  }
};

var Page = {
  init : function (cbfunc){
    AJAX.call("jsp/session.jsp", null, function(data){
      var uid = data.trim();
      if(uid == "null"){
        alert("Service that needs login");
        window.location.href = "login.html";
      }
      else {
        if(cbfunc != null) cbfunc(uid);
      }
    });
  }
};
