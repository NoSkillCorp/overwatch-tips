import { Actions } from '../actions'

const counter = (state = { tips: 0, votes:0 }, action) => {
  switch (action.type) {
    case Actions.UPDATE_COUNTER:
      return action.payload
    default:
     return state
  }
}
export default counter