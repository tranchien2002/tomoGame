import React, { Component } from 'react';
import { Container, Row, Col } from 'reactstrap';
import Web3 from 'web3';


import './App.css';



class App extends Component {

    constructor(props){
        super(props)
        this.state ={
            account : '0x0',
            balance : ''
        }    
 

    }
    
    async componentDidMount(){
        const web3 = new Web3(Web3.givenProvider || "http://localhost:8545");

        await web3.eth.getCoinbase().then((account)=>{
            this.setState({account})
        });

        await web3.eth.getBalance(this.state.account).then((balance)=>{
            balance = web3.utils.fromWei(balance);
            this.setState({balance})
        })
    }


    
    render() {
        return (
            <div>
                <Container>
                    <Row className="set_height">
                        <Col className = "box_color" xs="8">
                            <div className="margin_box ">
                                {/* question */}
                                <div className = "question"> 
                                    <Col className = "user_account">
                                        <h5><strong>Your account :</strong> {this.state.account}</h5>
                                        <p><strong>Balance :</strong> {this.state.balance} <strong>ETH</strong></p>
                                    </Col>
                                    <Col className = "question_box">
                                        <div className ="question_position">
                                            <h1 >question </h1>
                                        </div>
                                    </Col>
                                </div>
                                {/* answer */}
                                <div className = "question">
                                    <p>
                                        1
                                    </p>
                                    <p>
                                        2
                                    </p>
                                    <p>
                                        3
                                    </p>
                                </div>
                            </div>
                        </Col>
                        <Col className = "box_color" xs="4">
                            <div className="ranking margin_box">
                                {/* Ranking */}
                                <div>
                                    <h1>Ranking</h1>
                                </div>
                                {/* member ranking */}
                                <div >
                                    <p>
                                        123121312132132
                                    </p>
                                </div>
                            </div>
                        </Col>
                    </Row>
                </Container>
            </div>
                  
        );
    }
}

export default App;
