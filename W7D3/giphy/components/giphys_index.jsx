import React from 'react';

import GiphysIndexItem from './giphys_index_item';


export default class GiphysIndex extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            searchTerm: ""
        }
        this.handleSubmit = this.handleSubmit.bind(this)
    }


handleChange(event) {
    this.setState({searchTerm: event.currentTarget.value});
}

handleSubmit(e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state).then(
        () => {
            this.setState({ body: "", title: "" });
        }
    )
}

render(){
    return (
        <form onSubmit={this.handleSubmit}>
            <label> Title
                <input onChange={this.handleChange}  type="text" value={this.state.title}/>
            </label>
            <button>Submit</button>
        </form>
    )
}
}