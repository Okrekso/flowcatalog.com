class cartItem extends Component {
    constructor(props) {
        super(props);
    }
    render() { 
        return ( 
            <div class='cartItem'>
                <p id='name'>{this.props.name}</p>
                <p id='price'>{this.props.price}</p>
            </div>
         );
    }
}

