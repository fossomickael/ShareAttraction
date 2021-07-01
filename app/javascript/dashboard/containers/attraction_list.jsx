import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { setAttractions } from "../actions/attractions";
import Attraction  from "../components/attraction";

class AttractionList extends Component {
    componentDidMount() {
      this.props.setAttractions(this.props.username);
    }
  
    render() {
      return (
        <div>
        {this.props.attractions.map((attraction) => {
          return <Attraction key={attraction.id} attraction={attraction} />;
        })} </div>
      );
    }
}

const mapStateToProps = (state) => {
  return {
    attractions: state.attractions,
    username: state.username
  };
};

const mapDispatchToProps = (dispatch) => {
  return bindActionCreators({ setAttractions }, dispatch);
};


export default connect(mapStateToProps, mapDispatchToProps)(AttractionList);