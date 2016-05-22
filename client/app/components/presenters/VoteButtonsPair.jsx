import React from 'react'
import VoteButton from './VoteButton'

const VoteButtonsPair = ({ plusActive, minusActive, onVote }) => { 
  return (
    <div className="vote_links">
      <VoteButton type="1" active={plusActive} onButtonClick={onVote} />
      &nbsp;
      <VoteButton type="-1" active={minusActive} onButtonClick={onVote} />
    </div>
  )
}
export default VoteButtonsPair