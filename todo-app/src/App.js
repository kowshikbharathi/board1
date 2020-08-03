import React, { Component } from 'react';
import { BrowserRouter as Router, Route } from "react-router-dom";
import Navbar from './view/navbar';
import AddTask from './view/add/addTask';
import ViewData from './view/add/viewData';
import Update from './view/add/update';


class App extends Component {

  render(){
    return(
      <Router>
      <Route exact path="/addTask" component={AddTask} />
      <Route exact path="/" component={Navbar} />
      <Route exact path="/viewData" component={ViewData} />
      <Route exact path="/update/:id" component={Update} />
      </Router>
    );
    }
    
  
}

export default App;