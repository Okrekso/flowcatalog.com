function Load()
{
    RenderShop();
    animSearch();
    
    $('#acc_b').mousedown(()=>{openAccount()});
    $('#cart_b').mousedown(()=>{cartAction()});
}

function animSearch()
{
    $("#search input").animate({width:"300pt"},1000,()=>{$("#search .btn").animate({opacity:1},500)});
}
//pages
function go_nextPage() //go to the next page of items
{
    page+=1;
    RenderShop(page);
    $('#pager #page_num').text(page+1);
    if(page>0){$('#prev_page').removeClass('close');  $('#prev_page').addClass('open');}
}
function go_prevPage() //go to the previouse page of items
{
    if(page>0) page-=1;
    RenderShop(page);
    $('#pager #page_num').text(page+1);
    if(page==0) {$('#prev_page').removeClass('open');  $('#prev_page').addClass('close');}
}

var page=0;
//pages

//account
var acc_open=false;
function openAccount()
{
    if(!acc_open)
    {
        $('.interface_acc').css('display','flex');
        setTimeout(()=>{$('.interface_acc').css('opacity','1')},100);
        $('.interface_acc #arrow').addClass('account_arrow');
        acc_open=true;
    }
    else
    {
        $('.interface_acc').css('opacity','0');
        setTimeout(()=>{$('.interface_acc').css('display','none')},1000);
        acc_open=false;
    }
}

//cart
cart_open=false;
function cartAction()
{
    height=incart.length*35;
    height+=35;
    if(!cart_open){$('.interface_cart').css('height','300pt'); cart_open=true}
    else{$('.interface_cart').css('height','0pt'); cart_open=false}
}