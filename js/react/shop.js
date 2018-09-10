function Item(props)
{
    class BuyBtn extends React.Component
    {
        addToCart()
        {
            var source=$('#buy_'+this.props.id+" img");
            source.animate({height:"85%"},100,
            ()=>{source.attr('src','/pics/success.png'); source.animate({height:"100%"},100)});
            
            $('#buy_'+this.props.id).hover(()=>{$(this).css('background','red')});

            let sourceLoad=('#buy_'+this.props.id);
            incart.push(sourceLoad);
        }

        removeFromCart()
        {
            var source=$('#buy_'+this.props.id+" img");
            source.animate({height:"50%"},100,
            ()=>{source.attr('src','/pics/cart.png'); source.animate({height:"60%"},100)});

            var sourceLoad=('#buy_'+this.props.id);
            incart.splice(sourceLoad);
        }

        functional()
        {
            var source=('#buy_'+this.props.id);
            if(incart.indexOf(source)==-1) this.addToCart();
            else this.removeFromCart();
        }

        constructor(props)
        {
            super(props);
        }
        render()
        {
            return <div id={'buy_'+this.props.id} onMouseDown={(e)=>this.functional(e)} className='btn'> 
            <p id='price'>{this.props.price}<b> UAH</b></p>
            <img src='pics/cart.png'/>
            </div>;
        }
    }

    function Tags()
    {
        var tags=props.tags.split(';');
        tags=tags.filter(i=>i!='');
        var tags_p=[];
        for (var i=0;i<tags.length;i++)
        {
            tags_p.push(<div key={i} className='tag'>{tags[i]}</div>)
        }
        return <div id='tags'>{tags_p}</div>;
    }
    return(
        <div className={props.count>0?'itm':'itm end'} id={'itm_'+props.id}>
            <b><p className='Header'>{props.name}</p></b>
            <p className='descript'>about</p>
            <img src={props.img==null?'/pics/noimg.png':props.img}/>
            {(props.count>0)?<Tags/>:''}
            {(props.count>0)?<BuyBtn price={props.price} id={props.id}/>:''}
        </div>
        );
}
//render
function RenderShop()
{
    var items;
    var ajax = $.ajax(
        {
            url:"/php/renderShop.php",
            async:false,
            success: function(res)
            {
                items = JSON.parse(res);
            }
        }
    );
    function App()
    {
        var items_p=[];
            for(var i=0;i<items.length;i++)
            {
                items_p.push(<Item key={items[i][0]} name={items[i][1]} price={items[i][2]} img={items[i][4]} tags={items[i][3]} count={items[i][5]} id={items[i][0]}/>);
            }
        return (<div id='shop_content'><div id='items'>{items_p}</div><div id='pager'></div></div>);
    }
    ReactDOM.render(<App/>,document.getElementById('main'));
    animateInRow(".itm",100);
    
}
function animateInRow(classToAnim, delay,animFrom={marginTop:"-=20pt",opacity:0},animTo={marginTop:"+=20pt",opacity:1})
{
    var del=0;
    $(classToAnim).animate(animFrom,0);
    $(classToAnim).each((i,itm)=>{$("#"+itm.id).delay(del).animate(animTo,500); del+=delay;});
}
//items
var incart=[];