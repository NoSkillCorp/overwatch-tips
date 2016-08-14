import { connect } from 'react-redux'
import TipPanel from '../presenters/TipPanel'

const mapStateToProps = (state) => {
  let gamingObject = state.config.gamingObject,
    tip = state.config.tip
  return {
    gamingObject,
    tip
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
  }
}

const TipPanelState = connect(
  mapStateToProps,
  mapDispatchToProps
)(TipPanel)
export default TipPanelState
