function Load()
{
    RenderShop();
    animSearch();

    $('.btn').each((i,id)=>{$(id).mousedown(()=>{btnDown(id)})});
}

function animSearch()
{
    $("#search input").animate({width:"300pt"},1000,()=>{$("#search .btn").animate({opacity:1},500)});
}

function btnDown(id) //function for animating btns
{
    let fontsize=$(id).css('font-size');
    fontsize=parseInt(fontsize);
    fontsize_small = fontsize - fontsize*0.25;
    $(id).css('font-size',fontsize_small);
    setTimeout(()=>{$(id).css('font-size',fontsize);},200);
}