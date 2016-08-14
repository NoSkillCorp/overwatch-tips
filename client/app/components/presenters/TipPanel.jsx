import React from 'react'
import VoteButtonsState from '../containers/VoteButtonsState'
import classNames from 'classnames'

const renderIcon = (gamingObject) => (
  <div className="tip_gaming_object_description pull-left text-center">
    <a href={gamingObject.path} className="image-link">
    <img src={gamingObject.iconPath} className="gaming_object_icon" />
    </a>
  </div>
)

const renderCategory = (tip, gamingObject) => (
  <a href={gamingObject.path} className="btn-link">
    <span className="playing_sentence">{tip.category}</span><br />
  </a>
)

const TipPanel = ({ gamingObject, tip }) => {
  let GmoIcon, GmoCategory
  if(gamingObject.withGamingObjectDescription) {
    GmoIcon = renderIcon(gamingObject)
    GmoCategory = renderCategory(tip, gamingObject)
  }
  let panelClass = classNames({
    "panel panel-default tip_panel": true,
    "is_voted": tip.isVoted,
    "is_not_voted": !tip.isVoted
  })
  
  return (
    <div className={panelClass} id={tip.id}>
      <div className="panel-body text-justify">
        <div>
          <div className="pull-left tip_score_panel text-center">
            <div className="tip_score">
              {tip.score}
            </div>
            
            <div className="tip_posneg_scores">
              +<span className="tip_positive_score">{tip.positiveScore}</span>
              /
              -<span className="tip_negative_score">{tip.negativeScore}</span>
            </div>
            
             <VoteButtonsState />
          </div>
          
          {GmoIcon}
        </div>
        
        {GmoCategory}

        <span className="tip_description">{tip.description}<br /><br /></span>
        
        <div className="tip_footer">
          <span className="time_ago">{tip.createdAt}</span>
        </div>
      </div>
    </div>
  )
}
export default TipPanel