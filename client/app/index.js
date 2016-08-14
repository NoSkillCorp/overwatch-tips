import React from 'react'
import { Provider } from 'react-redux'
import { applyMiddleware, createStore } from 'redux'
import ReactOnRails from 'react-on-rails'
import Reducers from './reducers'
import WebSocket from './middleware'

import Counter from './components/containers/CounterState'

ReactOnRails.registerStore({
  ReduxStore: (props, railsContext) => {
    console.debug("Setting up Redux store")
    return createStore(Reducers, props,
      applyMiddleware(WebSocket),
      window.devToolsExtension ? window.devToolsExtension() : undefined
    )
  }
})

ReactOnRails.register({
  Counter: (props) => (<Provider store={ReactOnRails.getStore("ReduxStore")}><Counter /></Provider>)
})
  