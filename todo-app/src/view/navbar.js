import React, { Component } from 'react';
import { Link } from "react-router-dom";
import 'bootstrap/dist/css/bootstrap.min.css';

class Navbar extends Component{

  render(){
  return (
      <div>
    <nav className="navbar navbar-expand-sm">
      <div className="container">
        <a className="navbar-brand" href="/">
          Home</a>
      </div>
    </nav>
    <div className="container">
        <Link to="/addTask" className="btn btn-primary mb-3">
          <i className="fas fa-plus-circle"> Create Task</i>
        </Link>
        <br />
        <hr />
        <Link to="/viewData" className="btn btn-success mb-3">
          <i className="fas fa-plus-circle"> All-Users</i>
        </Link>
        </div>
</div>
  );
    }
}
export default Navbar;