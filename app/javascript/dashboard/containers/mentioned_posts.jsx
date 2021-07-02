import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { setMentions } from "../actions/mentions";
import Post  from "../components/post";


class MentionedPosts extends Component {
    componentDidMount() {
        this.props.setMentions(this.props.username);
      }


      render() {
        return (
          <div>
              <h4>They mentioned you!</h4>
          {this.props.mentioned_posts.map((post) => {
                   return <Post key={post.id} post={post} />;
            })}
          </div>
        );
      }

}

const mapStateToProps = (state) => {
    return {
      mentioned_posts: state.mentioned_posts,
      username: state.username
    };
  };
  
const mapDispatchToProps = (dispatch) => {
    return bindActionCreators({ setMentions }, dispatch);
};
  

export default connect(mapStateToProps, mapDispatchToProps)(MentionedPosts);