import React from 'react';
import { Link } from 'react-router-dom';


const Post = (props) => {
  return ( <div className="notification">
        <img src='https://kitt.lewagon.com/placeholder/users/arthur-littm' className="avatar-large" />
        <div className="notification-content">
            <p><small>{props.post.title} by @{props.post.author}</small></p>
            <p> My share link:{props.post.link}?ref={props.post.referrer_code}</p>
        </div>

        <div className="notification-actions">
            <a href={`http://www.linkedin.com/shareArticle?url=${props.post.linkedin_link}&title=${props.post.title}" target="_blank" classNale="share-btn linkedin" `}>
            <i className="fab fa-linkedin-in"></i>
         </a>

            <a className="twitter-share-button"
            href={`${props.post.twitter_link}?ref=${props.post.referrer_code}`}>
            <i className="fab fa-twitter action"></i></a>
            <a href="#"> <i className="fas fa-archive archive"></i></a>
        </div>
        </div>
  );
};


export default Post;