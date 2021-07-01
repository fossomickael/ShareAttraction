import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore, combineReducers, applyMiddleware } from 'redux';
import { reducer as formReducer } from 'redux-form';
import promise from 'redux-promise-middleware';
import logger from 'redux-logger';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import { createHistory as history } from 'history';
import App from './components/app';
import attractionsReducer from './reducers/attractions_reducer';
const initialState = {
    attractions: [],
    user_id: 55
  };
const reducers = combineReducers({
    // key: reducer
    attractions: attractionsReducer,
    user_id: (state = null, action) => state
});
  
const middlewares = applyMiddleware(promise, logger);
const store = createStore(reducers, initialState, middlewares);

ReactDOM.render(
    <Provider store={store}>
      <Router history={history}>
        <Switch>
          <Route path="/" exact component={App} />
          
  
        </Switch>
      </Router>
    </Provider>,
    document.getElementById('root')
);