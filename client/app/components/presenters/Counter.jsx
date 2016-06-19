import React from 'react'

const Counter = ({ tips, votes }) => { 
  return (
    <div className="navbar-text score">
      Tips : <span id="tips_count">{tips}</span> / 
      Votes : <span id="votes_count">{votes}</span>
    </div>   
  )
}
export default Counter
