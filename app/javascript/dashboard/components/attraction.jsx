import React from 'react';
import { Link } from 'react-router-dom';

const Attraction = (props) => {
  return ( <div className="notification">
                <img src='https://kitt.lewagon.com/placeholder/users/arthur-littm' className="avatar-large" />
                <div className="notification-content">
                <p><small> "{props.attraction.title} by @{props.attraction.author}" </small></p>
                <p> My share"https://shareattraction.com#"</p>
                </div>

                <div className="notification-actions">
                <script src="https://platform.linkedin.com/in.js" type="text/javascript">lang: en_US</script>
                 <a className="twitter-share-button"
                href="">
                <i className="fab fa-twitter action"></i></a>
                <a href="#"> <i className="fas fa-archive archive"></i></a>
            </div>
         </div>
  );
};


export default Attraction;