import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore, combineReducers, applyMiddleware } from 'redux';
import { Router } from "react-router";
import promise from 'redux-promise-middleware';
import logger from 'redux-logger';
import { Route, Switch } from 'react-router-dom';
import { createBrowserHistory  } from "history";
import App from './components/app';
import MentionedPosts from './containers/mentioned_posts';
import attractionsReducer from './reducers/attractions_reducer';
import mentionsReducer from './reducers/mentions_reducer';

const history = createBrowserHistory();
let username = "",

username_span = document.getElementById("username")
if (username_span)
{
  username = username_span.innerText
}
  
const initialState = {
    attractions: [],
    username: username
};
const reducers = combineReducers({
    // key: reducer
    attractions: attractionsReducer,
    mentioned_posts: mentionsReducer,
    username: (state = null, action) => state
});
  
const middlewares = applyMiddleware(promise, logger);
const store = createStore(reducers, initialState, middlewares);

ReactDOM.render(
    <Provider store={store}>
      <Router history={history}>
        <Switch>
          <Route path="/dashboard" exact component={App} />
          <Route path="/dashboard/mentionedposts" component={MentionedPosts} />
  
        </Switch>
      </Router>
    </Provider>,
    document.getElementById('root')
);