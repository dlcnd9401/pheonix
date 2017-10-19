$(document).ready(function(){
    //최상단 체크박스 클릭
    $("input:checkbox").off();
    $("input:checkbox").on("click", function(){        
        if($("input:checkbox").prop("checked")){
            $("input:checkbox").prop("checked",false); // 전체 체크박스의 값을 false로 변경
            $(this).prop("checked",true); // 현재 선택한 체크박스의 값만 true로 변경
        }else{
            $("input:checkbox").prop("checked",false);  // 전체 체크박스의 값을 false로 변경
        }
    });
});