import { connect } from 'react-redux'
import Counter from '../presenters/Counter'

const mapStateToProps = (state) => {
  let { tips, votes } = state.counter
  return { tips, votes }
}

const mapDispatchToProps = (dispatch) => {
  return {}
}

const CounterState = connect(
  mapStateToProps,
  mapDispatchToProps
)(Counter)
export default CounterState
