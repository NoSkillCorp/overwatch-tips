import { connect } from 'react-redux'
import VoteButtonsPair from '../presenters/VoteButtonsPair'

const mapStateToProps = (state) => {
  let plusActive = state.config.tip.plusActive,
    minusActive = state.config.tip.minusActive
  return {
    plusActive,
    minusActive
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    onVote: (type) => alert(type)//dispatch()
  }
}

const VoteButtonsState = connect(
  mapStateToProps,
  mapDispatchToProps
)(VoteButtonsPair)
export default VoteButtonsState
