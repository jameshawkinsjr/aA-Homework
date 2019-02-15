import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = {total: 0, num1: 0, num2: 0};
    this.setNum1 = this.setNum1.bind(this);

  }

  input(e) {

  }

  render(){
    return (
      <div>
        <h1>Hello World</h1>
        <h2>Total: {this.state.total}</h2>
        <input onChange={this.setNum1()} type="text" ></input>
        <h2>Total: {this.state.num1}</h2>
      </div>
    );
  }

  setNum1(e) {
    this.setState = {num1: 5}
  }
}

export default Calculator;
