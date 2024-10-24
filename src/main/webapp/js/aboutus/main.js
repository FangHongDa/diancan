/**
 * Created by asus-pc on 2017/5/17.
 */
window.onscroll = function () {
    if($("body").scrollTop()>=500){
        $(".main-skills").children().addClass("animated rotateInDownLeft");
    }else {
        $(".main-skills").children().removeClass("animated rotateInDownLeft");
    }
};
var liclick = $(".navbar-nav");
liclick.children().on("click",function () {
    $("this").addClass("active").siblings().removeClass("active");
    switch($(this).attr("id")){
        case "aboutMe":
            $("body").animate({scrollTop:0},1000);
            break;
    };
});
