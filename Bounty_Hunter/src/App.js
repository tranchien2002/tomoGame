import React, { Component } from 'react';
import { Container, Row, Col, Button } from 'reactstrap';


import './App.css';

class App extends Component {
  
    render() {
        return (
            <div>
                <Container>
                    {/* <div className="header"></div> */}
                    <Row className="set_height">
                        <Col className = "box_color" xs="8">
                            <div className="margin_box ">
                                {/* question */}
                                <div className = "question"> 
                                    <h1>question</h1>
                                </div>
                                {/* answer */}
                                <div>
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
                                <div>
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
