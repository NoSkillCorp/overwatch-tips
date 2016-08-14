import { combineReducers } from 'redux'
import counter from './counter'

const Reducers = combineReducers({
    config: (s = {}) => s,
    counter
})
export default Reducers