import ActionCable from 'actioncable'
import actionBuilder from '../actions'

const middleware = (store) => {
  const cable = ActionCable.createConsumer('/cable')
  
  const counter = cable.subscriptions.create('CounterChannel', {  
    received: (data) => {
      store.dispatch(actionBuilder("UPDATE_COUNTER", data))
    }
  })

  return next => action => {
    // do something
    return next(action)
  }
}
export default middleware