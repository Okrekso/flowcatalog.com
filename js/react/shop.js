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
            return <div id={'buy_'+this.props.id} onMouseDown={(e)=>this.functional(e)} className='btn'> <img src='pics/cart.png'/></div>;
        }
    }
    function Tags()
    {
        var tags=['food','sneaks','sport','football']
        var tags_p=[];
        for (var i=0;i<tags.length;i++)
        {
            tags_p.push(<div key={i} className='tag'>{tags[i]}</div>)
        }
        return <div id='tags'>{tags_p}</div>;
    }
    return(
        <div className='itm' id={'itm_'+props.id}>
            <b><p className='Header'>Item name example big name of item</p></b>
            <p className='descript'>about</p>
            <img src='/pics/noimg.png'/>
            <Tags/>
            <BuyBtn id={props.id}/>
        </div>
        );
}
//render
function RenderShop()
{
    function App()
    {
        var items=[];
            for(var i=0;i<9;i++)
            {
                items.push(<Item key={i} id={i}/>);
            }
        return (<div id='items'>{items}</div>);
    }
    ReactDOM.render(<App/>,document.getElementById('main'));
}

var incart=[];