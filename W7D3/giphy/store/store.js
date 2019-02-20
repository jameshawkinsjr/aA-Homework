import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import RootReducer from '../reducers/root_reducer';
import root_reducer from '../reducers/root_reducer';

const configureStore = () => {
    return createStore(root_reducer, applyMiddleware(thunk))      
};

export default configureStore;