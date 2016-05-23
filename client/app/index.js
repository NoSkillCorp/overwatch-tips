import React from 'react'
import { Provider } from 'react-redux'
import { createStore } from 'redux'
import ReactOnRails from 'react-on-rails'
import Reducers from './reducers'
import VoteButtonsPair from './components/presenters/VoteButtonsPair'
import VoteButtonsState from './components/containers/VoteButtonsState'


const createStoreWithProps = (props) => {
    console.debug("Setting up store with ", props)
    return createStore(Reducers, { config: props },
      window.devToolsExtension ? window.devToolsExtension() : undefined
    )
  },
  /**
   * Helper to wrap a components in a provider, given a Redux store.
   * @method
   * @param  {Object} component
   * @param  {Object} store
   * @return {function} to be registered
   */
  registerWithStore = (component, store) => (
    (p) => <Provider store={store}>{React.createElement(component, p)}</Provider>
  )

/**
 * Register Redux store with initial state
 */
ReactOnRails.registerStore({
  ReduxStore: createStoreWithProps({})
})

ReactOnRails.register({
  App: () => {
    console.debug("Setting up React app")
    return (
      <Provider store={ReactOnRails.getStore("ReduxStore")}>
        {/* <-- INSERT APP HERE -!> */}
      </Provider>
    )
  },
  VoteButtonsPair,
  VoteButtonsState: (props) => registerWithStore(VoteButtonsState, createStoreWithProps(props))()
})