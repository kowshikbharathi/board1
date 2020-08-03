import React, { Component } from 'react';
import { Link } from "react-router-dom";
import axios from 'axios'
import Update from './update';
import Navbar from '../navbar';
import Avatar from '@material-ui/core/Avatar';

class ViewData extends Component{
    constructor(props){
        super(props);
        this.state={
            courses: [],
            message: null,
            id:""
        };
       // this.deleteCourseClicked = this.deleteCourseClicked.bind(this);
     
    axios.get('http://localhost:8080/entry/board/all').then(res => {
        this.setState({ courses: res.data })
        
    });
    
}
updateCourseClicked(id){
    //console.log(id);
    
        this.props.history.push('/update/'+id);
        //<Update id={this.id} />
}
deleteCourseClicked(id){
    console.log(id);
    axios.delete('http://localhost:8080/entry/board/'+id).then(
    window.location.reload(false));
        }
    render() {
        
        return (
                <div className="container">
                     <Link to="/" className="btn btn-info mb-3">
                    <i className="fas fa-plus-circle"> Back To DashBoard</i>
                    </Link>
                    <h3>All Courses</h3>
                    <div className="container">
                        <table className="table">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Age</th>
                                    <th>FirstName</th>
                                    <th>LastName</th>
                                    <th>UserName</th>
                                    <th>Delete</th>
                                    <th>Update</th>
                                </tr>
                            </thead>
                            <tbody>
                                {
                                    this.state.courses.map(
                                        course =>
                                            <tr key={course.id}>
                                                <td><Avatar aria-label="recipe" >
            {course.firstname.charAt(0).toUpperCase()}</Avatar></td>
                                                <td>{course.age}</td>
                                                <td>{course.firstname}</td>
                                                <td>{course.lastname}</td>
                                                <td>{course.username}</td>
                                                <td><button className="btn btn-warning" onClick={() => this.deleteCourseClicked(course.id)}>DELETE</button></td>
									            <td><button className="btn btn-info" onClick={() => this.updateCourseClicked(course.id)}>UPDATE</button></td>
                                            </tr>
                                    )
                                }
                            </tbody>
                        </table>
                    </div>
                </div>
                
                   );
    }

}

export default ViewData;