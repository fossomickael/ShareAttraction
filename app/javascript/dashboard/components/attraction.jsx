import React from 'react';
import { Link } from 'react-router-dom';
import Post  from "./post";
const Attraction = (props) => {
  return ( <div className="attraction">
               <h2>{props.attraction.name}</h2>
               <div className="row">
                 {props.attraction.posts.map((post) => {
                   return <Post key={post.id} post={post} />;
                 })}
                </div>
            </div>
  );
};


export default Attraction;